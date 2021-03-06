import 'package:bloc/bloc.dart';
import 'package:dev_hack2/constants.dart';
import 'package:dev_hack2/domain/repositories/repositories.dart';
import 'package:dev_hack2/domain/services/storage.dart';
import 'package:dev_hack2/modules/login/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/physics.dart';
import 'package:formz/formz.dart';
import 'package:get_it/get_it.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authenticationRepository) : super(const LoginState());

  final _storage = GetIt.I<Storage>();

  final AuthenticationRepository _authenticationRepository;

  void loadFirstTime() {
    emit(state.copyWith(firstTime: _storage.getBool(FIRST_TIME_KEY) ?? true));
  }

  void usernameChanged(String value) {
    final username = Username.dirty(value);
    emit(state.copyWith(
      username: username,
      status: Formz.validate([username, state.password]),
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([state.username, password]),
    ));
  }

  Future<void> logInWithCredentials() async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await _authenticationRepository.logIn(
        firstTime: _storage.getBool(FIRST_TIME_KEY) ?? true,
        username: state.username.value,
        password: state.password.value,
      );

      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } catch (error) {
      print('123');
      print(error);
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
