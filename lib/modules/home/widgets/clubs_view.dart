import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dev_hack2/domain/models/club.dart';
import 'package:dev_hack2/domain/models/event.dart';
import 'package:dev_hack2/modules/home/cubit/home_cubit.dart';
import 'package:dev_hack2/modules/home/view/home_view.dart';
import 'package:dev_hack2/modules/home/widgets/event_card.dart';
import 'package:dev_hack2/widgets/app_bar_delegate.dart';
import 'package:dev_hack2/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shimmer/shimmer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

const double _fabDimension = 56.0;

class ClubsView extends StatelessWidget {
  const ClubsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventCubit, EventState>(
      builder: (context, state) {
        if (state is EventLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is EventLoaded)
          return ListView.builder(
              itemCount: state.clubs.length + 1,
              physics: ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12))),
                    ),
                  );
                }
                print(state.clubs[index - 1]);
                return ClubCard(
                    club: state.clubs[index - 1], tag: 'club$index');
              });
        return Container();
      },
    );
  }
}

class DetailClubView extends StatefulWidget {
  const DetailClubView({Key? key, required this.tag, required this.club})
      : super(key: key);

  final Object tag;
  final Club club;

  @override
  _DetailClubViewState createState() => _DetailClubViewState();
}

class _DetailClubViewState extends State<DetailClubView> {
  bool _editing = false;

  @override
  Widget build(BuildContext context) {
    print(widget.club.incomingEvents!.length);
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CustomScrollView(slivers: [
        SliverPersistentHeader(
            delegate: MySliverAppBar(
                topPad: MediaQuery.of(context).viewPadding.top,
                expandedHeight: 200,
                club: widget.club,
                tag: widget.tag),
            pinned: true),
        // SliverAppBar(
        //   expandedHeight: 160,
        //   pinned: true,
        //   backgroundColor: Colors.white,
        //   flexibleSpace: FlexibleSpaceBar(
        //     title: Text(widget.club.name),
        //     background: Stack(
        //       clipBehavior: Clip.none,
        //       children: [
        //         if (widget.club.backgroundImage != null)
        //           CachedNetworkImage(
        //               placeholder: (context, url) => Shimmer.fromColors(
        //                     child: Container(
        //                       height: 200,
        //                     ),
        //                     baseColor: Colors.grey[300]!,
        //                     highlightColor: Colors.grey[100]!,
        //                   ),
        //               imageUrl: (widget.club.backgroundImage!.url)),
        //         if (widget.club.backgroundImage == null)
        //           Container(
        //             height: 200,
        //             decoration: BoxDecoration(
        //                 gradient: LinearGradient(
        //                     colors: [Color(0xff8E2DE2), Color(0xFF4A00E0)],
        //                     begin: Alignment.topLeft,
        //                     end: Alignment.bottomRight)),
        //           ),
        //         Positioned(
        //           bottom: -35,
        //           left: 0,
        //           right: 0,
        //           child: Hero(
        //             tag: widget.tag,
        //             child: Container(
        //               height: 70,
        //               decoration: BoxDecoration(
        //                   image: DecorationImage(
        //                       image: CachedNetworkImageProvider(
        //                           widget.club.logo!.url))),
        //             ),
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // ),
        SliverList(
            delegate: SliverChildListDelegate([
          SizedBox(
            height: 35,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.club.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.club.description ?? ''),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: PrimaryButton(
              child: Text('Редактировать'),
              onPressed: () {
                setState(() {
                  _editing = !_editing;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Ближайшие мероприятия'),
              ],
            ),
          ),
          ..._buildEvents(),
        ]))
      ]),
      floatingActionButton: _buildFab(context),
    );
  }

  Widget? _buildFab(BuildContext context) {
    return OpenContainer(
        openBuilder: (_, action) => AddEvent(
            action: action,
            bloc: context.read<EventCubit>(),
            club: widget.club),
        closedElevation: 6.0,
        closedShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(_fabDimension / 2),
          ),
        ),
        closedColor: Theme.of(context).primaryColor,
        closedBuilder: (context, action) => SizedBox(
              height: _fabDimension,
              width: _fabDimension,
              child: Center(
                child: Icon(
                  Icons.add,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
            ));
  }

  List<Widget> _buildEvents() {
    final sortedEvents = widget.club.incomingEvents ?? [];
    sortedEvents.sort((a, b) => (a.count ?? 0) - (b.count ?? 0));
    if (sortedEvents.length == 0) return [];
    return [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: EventTile(
          event: sortedEvents[0],
          expanded: true,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text('Статистика клуба за неделю',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
      ),
      _buildStats(),
      ...sortedEvents.sublist(1).map((e) => EventTile(
            event: e,
            expanded: false,
          ))
    ];
  }

  Widget _buildStats() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SfCartesianChart(
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
          ]),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

class EventTile extends StatelessWidget {
  const EventTile({Key? key, required this.event, this.expanded = false})
      : super(key: key);

  final Event event;
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    if (expanded) {
      return EventCard(
        tag: '',
        onPressed: () {},
        event: event,
        showClub: false,
      );
    }
    return ListTile(
      title: Text(event.name),
      subtitle: Text('25 partc'),
    );
  }
}

class ClubCard extends StatelessWidget {
  const ClubCard({Key? key, required this.tag, required this.club})
      : super(key: key);

  final Object tag;
  final Club club;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailClubView(club: club, tag: tag)));
      },
      title: Text(club.name),
      subtitle: Text(_buildCount(club.count!)),
      leading: Hero(
        tag: tag,
        child: CircleAvatar(
          backgroundImage: CachedNetworkImageProvider(club.logo?.url ?? ''),
        ),
      ),
    );
  }

  String _buildCount(int count) {
    if (count > 10 && count < 19) {
      return '${count} участников';
    } else {
      final mod = count % 10;
      if (mod == 1) return '${count} участник';
      if (mod < 5 && mod > 1) return '${count} участника';
      return '${count} участников';
    }
  }
}
