import 'package:bloc/bloc.dart';
import 'package:dev_hack2/domain/models/models.dart';
import 'package:equatable/equatable.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState());

  void updateUser(User user) {
    emit(AppState(user: user));
  }
}

class AppState extends Equatable {
  const AppState({this.user = User.empty});

  final User user;

  @override
  List<Object?> get props => [user];
}
