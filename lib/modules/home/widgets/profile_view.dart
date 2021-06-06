import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dev_hack2/domain/blocs/authentication/authentication.dart';
import 'package:dev_hack2/domain/services/firebase_storage.dart';
import 'package:dev_hack2/modules/app/bloc/app_cubit.dart';
import 'package:dev_hack2/modules/home/cubit/home_cubit.dart';
import 'package:dev_hack2/modules/home/widgets/clubs_view.dart';
import 'package:dev_hack2/modules/home/widgets/market_page.dart';
import 'package:dev_hack2/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final _picker = ImagePicker();
  final _storage = GetIt.I<FirebaseStorageService>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 25),
            Stack(
              clipBehavior: Clip.none,
              children: [
                BlocBuilder<AppCubit, AppState>(
                  builder: (context, state) {
                    return InkWell(
                      borderRadius: BorderRadius.circular(100),
                      onTap: () {
                        _pickFile();
                      },
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: state.user.photoUrl != null &&
                                state.user.photoUrl!.isNotEmpty
                            ? CachedNetworkImageProvider(state.user.photoUrl!)
                            : null,
                        child:
                            state.user.photoUrl == null ? Text('Name') : null,
                      ),
                    );
                  },
                ),
                Positioned(
                  right: -5,
                  bottom: -5,
                  child: Material(
                    color: Colors.white,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Icon(
                        Icons.add_a_photo,
                        color: Colors.black87,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('25',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    Text('достижений',
                        style: TextStyle(color: Colors.black.withOpacity(0.7)))
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BlocBuilder<AppCubit, AppState>(
                      builder: (context, state) {
                        return Text(state.user.points.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18));
                      },
                    ),
                    Text('ПСБаллов',
                        style: TextStyle(color: Colors.black.withOpacity(0.7)))
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: PrimaryButton(
                child: Text('Обменять баллы'),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MarketPage()));
                },
              ),
            ),
            Container(
              height: 25,
              color: Colors.black.withOpacity(0.05),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text('Ваши клубы',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  BlocBuilder<EventCubit, EventState>(
                    builder: (context, state) {
                      if (state is EventLoading) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is EventLoaded) {
                        final clubs = state.clubs;
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Container(
                            height: 120,
                            child: BlocBuilder<AppCubit, AppState>(
                              builder: (context, state) {
                                final user = state.user;
                                final newClubs = clubs
                                    .where((element) =>
                                        user.clubs.contains(element.name))
                                    .toList();
                                if (newClubs.isEmpty) {
                                  return Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text('У вас пока нет клубов'),
                                  );
                                }
                                return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: newClubs.length,
                                    itemBuilder: (context, index) {
                                      final club = newClubs[index];
                                      return InkWell(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetailClubView(
                                                          tag: index.toString(),
                                                          club: club)));
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              SizedBox(
                                                height: 70,
                                                child: Hero(
                                                  tag: index.toString(),
                                                  child: CachedNetworkImage(
                                                    imageUrl: club.logo!.url,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(club.name,
                                                  style: TextStyle(
                                                      color: Colors.black54))
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              },
                            ),
                          ),
                        );
                      }
                      return Container();
                    },
                  )
                ],
              ),
            ),
            Container(
              height: 25,
              color: Colors.black.withOpacity(0.05),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('10 - 17 мая',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('10',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                            Text('Тренировок',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.7)))
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('956',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                            Text('минут',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.7)))
                          ],
                        ),
                        Spacer(),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('350',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Theme.of(context).primaryColor)),
                            Text('ПСБаллов',
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.7)))
                          ],
                        ),
                      ],
                    ),
                  ),
                  SfCartesianChart(
                      tooltipBehavior: TooltipBehavior(enable: true),
                      primaryXAxis: CategoryAxis(),
                      series: <LineSeries<List, int>>[
                        LineSeries<List, int>(
                            // Bind data source
                            dataSource: <List>[
                              [0, 1],
                              [1, 2],
                              [2, 1],
                              [3, 4]
                            ],
                            xValueMapper: (sales, _) => sales[0],
                            yValueMapper: (sales, _) => sales[1])
                      ])
                ],
              ),
            ),
            Container(
              height: 25,
              color: Colors.black.withOpacity(0.05),
            ),
            SettingsTile(
                onPressed: () {},
                name: 'Настройки уведомлений',
                icon: Icon(Icons.notifications_active)),
            SettingsTile(
                onPressed: () {},
                name: 'Настройки хранилища',
                icon: Icon(Icons.folder)),
            SettingsTile(
                onPressed: () {},
                name: 'Выйти',
                textColor: Colors.redAccent,
                icon: Icon(Icons.logout)),
          ],
        ),
      ),
    );
  }

  void _pickFile() async {
    final res = await _picker.getImage(source: ImageSource.gallery);
    if (res != null) {
      final url = await _storage.uploadFile(
          File(res.path), '/images' + res.path.split('/').join(''));
      context.read<AppCubit>().updateUser(
          context.read<AppCubit>().state.user.copyWith(photoUrl: url));
    }
  }
}

class SettingsTile extends StatelessWidget {
  final VoidCallback onPressed;
  final String name;
  final Widget icon;
  final Color textColor;
  const SettingsTile(
      {Key? key,
      required this.onPressed,
      required this.name,
      required this.icon,
      this.textColor = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Colors.black.withOpacity(0.08)))),
      child: ListTile(
        onTap: onPressed,
        trailing: icon,
        title: Text(
          name,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
