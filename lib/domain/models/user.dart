import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User(
      {required UserType type,
      required String id,
      @JsonKey(name: 'first_name') required String name,
      required String sex,
      required String username,
      @Default([]) @JsonKey(name: 'vizited_events') List<String?>? vizitedEvents,
      @Default([]) @JsonKey(name: 'registered_events') List<String?>? registeredEvents,
      @JsonKey(name: 'photo_url') String? photoUrl,
      @JsonKey(name: 'last_name') required String lastName,
      @Default([]) List<String> clubs,
      required int points}) = _User;

  static const empty = const User(
      username: '',
      sex: '',
      lastName: '',
      id: '',
      name: '',
      type: UserType.coach,
      points: 100000);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

enum UserType { stuff, coach }
