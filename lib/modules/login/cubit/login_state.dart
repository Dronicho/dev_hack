part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState(
      {this.username = const Username.pure(),
      this.password = const Password.pure(),
      this.status = FormzStatus.pure,
      this.firstTime = true});

  final bool firstTime;
  final Username username;
  final Password password;
  final FormzStatus status;

  @override
  List<Object> get props => [username, password, status, firstTime];

  LoginState copyWith(
      {Username? username,
      Password? password,
      FormzStatus? status,
      bool? firstTime}) {
    return LoginState(
        username: username ?? this.username,
        password: password ?? this.password,
        status: status ?? this.status,
        firstTime: firstTime ?? this.firstTime);
  }
}
