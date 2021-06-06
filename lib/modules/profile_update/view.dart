import 'package:dev_hack2/modules/profile_update/profile_cubit.dart';
import 'package:dev_hack2/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:formz/formz.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ProfileInitialUpdate extends StatefulHookWidget {
  ProfileInitialUpdate({Key? key}) : super(key: key);

  @override
  _ProfileInitialUpdateState createState() => _ProfileInitialUpdateState();
}

class _ProfileInitialUpdateState extends State<ProfileInitialUpdate> {
  String? sex;

  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController();
    final lastnameController = useTextEditingController();
    print(Theme.of(context).primaryColor);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Заполните профиль, чтобы продолжить'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  context.read<ProfileCubit>().nameChanged(value);
                },
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                    hintText: 'Имя',
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor),
                        borderRadius: BorderRadius.circular(6)),
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor),
                        borderRadius: BorderRadius.circular(6))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  context.read<ProfileCubit>().lastNameChanged(value);
                },
                controller: lastnameController,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                    hintText: 'Фамилия',
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor),
                        borderRadius: BorderRadius.circular(6)),
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor),
                        borderRadius: BorderRadius.circular(6))),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                      side: BorderSide(color: Colors.black54)),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(6),
                    onTap: () {
                      final cubit = context.read<ProfileCubit>();
                      showMaterialModalBottomSheet(
                          expand: false,
                          context: context,
                          builder: (context) => Container(
                                height: 300,
                                child: Column(
                                  children: [
                                    ListTile(
                                      onTap: () {
                                        cubit.sexChanged('Мужской');
                                        Navigator.of(context).pop();
                                      },
                                      title: Text('Мужской'),
                                    ),
                                    ListTile(
                                      onTap: () {
                                        cubit.sexChanged('Женский');
                                        Navigator.of(context).pop();
                                      },
                                      title: Text('Женский'),
                                    ),
                                    ListTile(
                                      onTap: () {
                                        cubit
                                            .sexChanged('БОЕВОЙ ВЕРТОЛЕТ АПАЧ');
                                        Navigator.of(context).pop();
                                      },
                                      title: Text('БОЕВОЙ ВЕРТОЛЕТ АПАЧ'),
                                    )
                                  ],
                                ),
                              ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 16.0),
                      child: Row(
                        children: [
                          BlocBuilder<ProfileCubit, ProfileState>(
                              buildWhen: (prev, current) =>
                                  prev.sex != current.sex,
                              builder: (context, state) => Text(
                                  state.sex.pure ? 'Пол' : state.sex.value)),
                          Spacer(),
                          Icon(Icons.arrow_downward)
                        ],
                      ),
                    ),
                  ),
                )),
            _buildClubsSelection(context),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) => PrimaryButton(
                    child: Text('Продолжить'),
                    loading: state.status.isSubmissionInProgress,
                    onPressed: state.status.isValidated
                        ? () {
                            context.read<ProfileCubit>().updateProfile();
                          }
                        : null),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildClubsSelection(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
              side: BorderSide(color: Colors.black54)),
          child: InkWell(
            borderRadius: BorderRadius.circular(6),
            onTap: () {
              final cubit = context.read<ProfileCubit>();
              showMaterialModalBottomSheet(
                  expand: false,
                  context: context,
                  builder: (context) => BlocProvider.value(
                        value: cubit,
                        child: SafeArea(
                          child: BlocBuilder<ProfileCubit, ProfileState>(
                              builder: (context, state) {
                            final cubit = context.read<ProfileCubit>();
                            return Column(
                              children: [
                                ListTile(
                                  leading: cubit.state.clubs
                                          .contains('football')
                                      ? Icon(Icons.check, color: Colors.blue)
                                      : null,
                                  onTap: () {
                                    cubit.clubsChanged(
                                        [...cubit.state.clubs, 'football']);
                                  },
                                  title: Text('Футбол'),
                                ),
                                ListTile(
                                  leading: cubit.state.clubs
                                          .contains('basketball')
                                      ? Icon(Icons.check, color: Colors.blue)
                                      : null,
                                  onTap: () {
                                    cubit.clubsChanged(
                                        [...cubit.state.clubs, 'basketball']);
                                  },
                                  title: Text('Баскетбол'),
                                ),
                                ListTile(
                                  leading: cubit.state.clubs
                                          .contains('volleyball')
                                      ? Icon(Icons.check, color: Colors.blue)
                                      : null,
                                  onTap: () {
                                    cubit.clubsChanged(
                                        [...cubit.state.clubs, 'volleyball']);
                                  },
                                  title: Text('Воллейбол'),
                                ),
                                ListTile(
                                  leading: cubit.state.clubs.contains('run')
                                      ? Icon(Icons.check, color: Colors.blue)
                                      : null,
                                  onTap: () {
                                    cubit.clubsChanged(
                                        [...cubit.state.clubs, 'run']);
                                  },
                                  title: Text('Бег'),
                                ),
                                ListTile(
                                  leading: cubit.state.clubs
                                          .contains('triatlon')
                                      ? Icon(Icons.check, color: Colors.blue)
                                      : null,
                                  onTap: () {
                                    cubit.clubsChanged(
                                        [...cubit.state.clubs, 'triatlon']);
                                  },
                                  title: Text('Триатлон'),
                                ),
                                ListTile(
                                  leading: cubit.state.clubs.contains('hockey')
                                      ? Icon(Icons.check, color: Colors.blue)
                                      : null,
                                  onTap: () {
                                    cubit.clubsChanged(
                                        [...cubit.state.clubs, 'hockey']);
                                  },
                                  title: Text('Хоккей'),
                                ),
                                ListTile(
                                  leading: cubit.state.clubs.contains('runPrep')
                                      ? Icon(Icons.check, color: Colors.blue)
                                      : null,
                                  onTap: () {
                                    cubit.clubsChanged(
                                        [...cubit.state.clubs, 'runPrep']);
                                  },
                                  title: Text('Бег с препятствиями'),
                                ),
                                ListTile(
                                  leading: cubit.state.clubs.contains('tennis')
                                      ? Icon(Icons.check, color: Colors.blue)
                                      : null,
                                  onTap: () {
                                    cubit.clubsChanged(
                                        [...cubit.state.clubs, 'tennis']);
                                  },
                                  title: Text('Теннис'),
                                )
                              ],
                            );
                          }),
                        ),
                      ));
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
              child: Row(
                children: [
                  Text('Нажмите, чтобы выбрать клубы'),
                  Spacer(),
                  Icon(Icons.arrow_downward)
                ],
              ),
            ),
          ),
        ));
  }
}

// firstname
// clubs
// lastname
// sex

