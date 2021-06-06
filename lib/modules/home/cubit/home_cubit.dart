import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dev_hack2/domain/models/club.dart';
import 'package:dev_hack2/domain/models/event.dart';
import 'package:dev_hack2/domain/repositories/event_repository.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class EventCubit extends Cubit<EventState> {
  EventCubit(this.repository) : super(EventInitial());

  EventRepository repository;

  void load() async {
    emit(EventLoading());
    final data = await repository.loadEvents();
    emit(EventLoaded(clubs: data[0], events: data[1]));
  }

  void loadAttachment(File file, void Function(String) onLoad) async {
    final res = await repository.loadAttachment(file, onLoad);
  }

  void participate(Event event) async {
    await repository.participate(event);
  }

  void register(Event event) async {
    await repository.register(event);
  }

  void updateEvent(Event event) {
    final currentState = state as EventLoaded;
    final newEvents = currentState.events.map((e) {
      if (e.id == event.id) {
        return event;
      }
      return event;
    }).toList();
    emit(EventLoaded(clubs: currentState.clubs, events: newEvents));
  }

  List<Event> eventsByDate(DateTime time) {
    final clubs = (state as EventLoaded).clubs;
    final events = clubs.expand((element) => element.incomingEvents!);
    return events
        .where((e) => e.date.day == time.day && e.date.month == time.month)
        .toList();
  }

  Future<Event> addEvent(Event event) async {
    print('test event jsom');
    print(event.toJson());
    final res = await repository.addEvent(event);
    load();
    return res;
  }
}
