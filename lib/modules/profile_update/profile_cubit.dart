import 'package:bloc/bloc.dart';
import 'package:dev_hack2/domain/repositories/repositories.dart';
import 'package:dev_hack2/domain/repositories/repository_profile.dart';
import 'package:dev_hack2/modules/login/models/username.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._repository) : super(ProfileState());

  final AuthenticationRepository _repository;

  void nameChanged(String value) {
    final name = Username.dirty(value);
    emit(state.copyWith(
      name: name,
      status: Formz.validate([name, state.lastName, state.sex]),
    ));
  }

  void sexChanged(String value) {
    final sex = Username.dirty(value);
    emit(state.copyWith(
      sex: sex,
      status: Formz.validate([sex, state.lastName, state.name]),
    ));
  }

  void lastNameChanged(String value) {
    final lastName = Username.dirty(value);
    emit(state.copyWith(
      lastName: lastName,
      status: Formz.validate([lastName, state.name, state.sex]),
    ));
  }

  void clubsChanged(List<String> value) {
    emit(state.copyWith(
      clubs: value,
      status: Formz.validate([state.name, state.lastName, state.sex]),
    ));
  }

  void updateProfile() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    await _repository.updateUser(
        name: state.name.value,
        lastName: state.lastName.value,
        sex: state.sex.value,
        clubs: state.clubs);
    emit(state.copyWith(status: FormzStatus.submissionSuccess));
  }
}

class ProfileState extends Equatable {
  const ProfileState(
      {this.name = const Username.pure(),
      this.lastName = const Username.pure(),
      this.clubs = const [],
      this.sex = const Username.pure(),
      this.status = FormzStatus.pure});

  final Username sex;
  final Username name;
  final Username lastName;
  final List<String> clubs;
  final FormzStatus status;

  @override
  List<Object> get props => [sex, name, status, clubs];

  ProfileState copyWith(
      {Username? name,
      Username? lastName,
      Username? sex,
      List<String>? clubs,
      FormzStatus? status}) {
    return ProfileState(
        name: name ?? this.name,
        lastName: lastName ?? this.lastName,
        status: status ?? this.status,
        clubs: clubs ?? this.clubs,
        sex: sex ?? this.sex);
  }
}
