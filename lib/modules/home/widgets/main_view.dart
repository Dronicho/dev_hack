import 'package:cached_network_image/cached_network_image.dart';
import 'package:dev_hack2/domain/models/club.dart';
import 'package:dev_hack2/domain/models/models.dart';
import 'package:dev_hack2/modules/app/bloc/app_cubit.dart';
import 'package:dev_hack2/modules/home/cubit/home_cubit.dart';
import 'package:dev_hack2/modules/home/widgets/clubs_view.dart';
import 'package:dev_hack2/modules/home/widgets/event_card.dart';
import 'package:dev_hack2/widgets/size_route.dart';
import 'package:dev_hack2/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../main.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      physics: ClampingScrollPhysics(),
      children: [EventsView(), CalendarView()],
    );
  }
}

final mockEvent = Event(
    id: '',
    clubs: [],
    type: EventType.competition,
    name: 'Баскетбол тренироука',
    location: '123123 123123',
    attachment: Attachment(
        id: '1',
        url:
            'https://images.unsplash.com/photo-1537589160116-2b4f378668aa?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1651&q=80'),
    date: DateTime.now());

class EventsView extends StatelessWidget {
  const EventsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventCubit, EventState>(
      builder: (context, state) {
        if (state is EventLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is EventLoaded) {
          return ListView.builder(
            itemCount: state.clubs.length,
            itemBuilder: (context, index) {
              final club = state.clubs[index];
              final oldContext = context;
              return Column(
                children: [..._buildCards(context, club, index)],
              );
            },
          );
        }
        return Container();
      },
    );
  }

  List<Widget> _buildCards(BuildContext context, Club club, int index) {
    final children = <Widget>[];
    final now = DateTime.now();
    for (var i = 0; i < club.incomingEvents!.length; i++) {
      final now = DateTime.now();
      final e = club.incomingEvents![i];
      children.add(Padding(
        padding: const EdgeInsets.all(14.0),
        child: EventCard(
          club: club,
          running: now.isAfter(e.date) &&
              now.isBefore(e.date.add(Duration(minutes: e.duration ?? 90))),
          event: e,
          tag: (i + index * 100).toString(),
          onPressed: () {
            Navigator.of(context).push(
              SizeRoute(
                  page: DetailedView(
                      club: club, tag: (i + index * 100).toString(), event: e)),
            );
          },
        ),
      ));
    }
    return children;
  }
}

class DetailedView extends StatefulWidget {
  const DetailedView(
      {Key? key, required this.tag, required this.event, required this.club})
      : super(key: key);
  final Object tag;
  final Event event;
  final Club club;

  @override
  _DetailedViewState createState() => _DetailedViewState();
}

class _DetailedViewState extends State<DetailedView> {
  late Event _event;
  late Club _club;

  @override
  void initState() {
    _event = widget.event;
    _club = widget.club;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(brightness: Brightness.light),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: BackButton(color: Colors.white),
            shadowColor: Colors.transparent),
        extendBodyBehindAppBar: true,
        body: SafeArea(
          top: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.event.attachment!.url.contains('https'))
                Hero(
                    tag: widget.tag,
                    child: CachedNetworkImage(
                        imageUrl: widget.event.attachment!.url)),
              if (!widget.event.attachment!.url.contains('https'))
                Hero(
                  tag: widget.tag,
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xff8E2DE2), Color(0xFF4A00E0)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight)),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  _event.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
                child: Text(
                  Format.of(context)!.format(_event.date) +
                      Format.of(context)!.formatTime(_event.date),
                  style: TextStyle(color: Colors.black.withOpacity(0.5)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(widget.event.description ?? 'Нет описания'),
              ),
              Column(
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailClubView(
                              tag: _club.name + _club.id, club: _club)));
                    },
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: Text(
                            'организатор',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black.withOpacity(0.6)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3.0),
                          child: Text(
                            widget.club.name,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    trailing: SizedBox(
                      width: 140,
                      child: BlocBuilder<AppCubit, AppState>(
                        builder: (context, state) {
                          final participate =
                              state.user.clubs.contains(_club.name);

                          return PrimaryButton(
                            child:
                                Text(participate ? 'Уже вступили' : 'Вступить'),
                            onPressed: participate
                                ? null
                                : () {
                                    setState(() {
                                      _club =
                                          _club.copyWith(participaate: true);
                                    });
                                    // context.read<EventCubit>().updateEvent(
                                    //     _event.copyWith(participate: true));
                                  },
                          );
                        },
                      ),
                    ),
                    subtitle: Text('25 участников'),
                    isThreeLine: true,
                    leading: Hero(
                      tag: _club.name + _club.id,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(_club.logo!.url),
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: BlocBuilder<AppCubit, AppState>(
                    builder: (context, state) {
                      final participate =
                          state.user.registeredEvents?.contains(_event.id) ??
                              false;
                      final now = DateTime.now();
                      final checked =
                          state.user.vizitedEvents?.contains(_event.id) ??
                              false;
                      final running = now.isAfter(_event.date) &&
                          now.isBefore(_event.date
                              .add(Duration(minutes: _event.duration ?? 90)));
                      return PrimaryButton(
                        color: running && participate ? Colors.green : null,
                        onPressed: participate
                            ? running
                                ? !checked
                                    ? () {
                                        context
                                            .read<EventCubit>()
                                            .participate(_event);
                                        context.read<AppCubit>().updateUser(
                                              state.user.copyWith(
                                                vizitedEvents: [
                                                  ...(state
                                                          .user.vizitedEvents ??
                                                      []),
                                                  _event.id
                                                ],
                                              ),
                                            );
                                      }
                                    : null
                                : null
                            : () {
                                setState(() {
                                  _event = _event.copyWith(participate: true);
                                });
                                try {
                                  context.read<EventCubit>().register(_event);
                                  context.read<AppCubit>().updateUser(state.user
                                          .copyWith(registeredEvents: [
                                        ...(state.user.registeredEvents ?? []),
                                        _event.id
                                      ]));
                                } catch (err) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: const Text(
                                              'Чтобы подтвердить свое участие, необходимо дать разрешение на геолокацию')));
                                }
                              },
                        child: participate
                            ? running
                                ? checked
                                    ? const Text('Вы уже отметились')
                                    : const Text('Отметиться')
                                : const Text('Вы участвете')
                            : const Text('Я пойду'),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CalendarView extends StatefulWidget {
  const CalendarView({Key? key}) : super(key: key);

  @override
  _CalendarViewState createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventCubit, EventState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              TableCalendar(
                eventLoader: (date) {
                  return [
                    {date: context.read<EventCubit>().eventsByDate(date)}
                  ];
                },
                focusedDay: DateTime.now(),
                calendarBuilders: CalendarBuilders(
                    singleMarkerBuilder: (contet, date, Map event) => Container(
                          width: 5,
                          height: 5,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                        )),
                lastDay: DateTime.now().add(Duration(days: 365)),
                firstDay: DateTime.now().subtract(Duration(days: 365)),
              )
            ],
          ),
        );
      },
    );
  }
}
