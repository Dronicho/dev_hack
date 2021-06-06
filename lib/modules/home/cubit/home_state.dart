part of 'home_cubit.dart';

abstract class EventState extends Equatable {
  @override
  List<Object?> get props => [];
}

class EventInitial extends EventState {}

class EventLoading extends EventState {}

class EventLoaded extends EventState {
  final List<Club> clubs;
  final List<Event> events;

  EventLoaded({required this.clubs, required this.events});

  @override
  List<Object?> get props => [clubs];
}
