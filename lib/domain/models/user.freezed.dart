// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
class _$UserTearOff {
  const _$UserTearOff();

  _User call(
      {required UserType type,
      required String id,
      @JsonKey(name: 'first_name')
          required String name,
      required String sex,
      required String username,
      @JsonKey(name: 'vizited_events')
          List<String?>? vizitedEvents = const [],
      @JsonKey(name: 'registered_events')
          List<String?>? registeredEvents = const [],
      @JsonKey(name: 'photo_url')
          String? photoUrl,
      @JsonKey(name: 'last_name')
          required String lastName,
      List<String> clubs = const [],
      required int points}) {
    return _User(
      type: type,
      id: id,
      name: name,
      sex: sex,
      username: username,
      vizitedEvents: vizitedEvents,
      registeredEvents: registeredEvents,
      photoUrl: photoUrl,
      lastName: lastName,
      clubs: clubs,
      points: points,
    );
  }

  User fromJson(Map<String, Object> json) {
    return User.fromJson(json);
  }
}

/// @nodoc
const $User = _$UserTearOff();

/// @nodoc
mixin _$User {
  UserType get type => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String get name => throw _privateConstructorUsedError;
  String get sex => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'vizited_events')
  List<String?>? get vizitedEvents => throw _privateConstructorUsedError;
  @JsonKey(name: 'registered_events')
  List<String?>? get registeredEvents => throw _privateConstructorUsedError;
  @JsonKey(name: 'photo_url')
  String? get photoUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String get lastName => throw _privateConstructorUsedError;
  List<String> get clubs => throw _privateConstructorUsedError;
  int get points => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {UserType type,
      String id,
      @JsonKey(name: 'first_name') String name,
      String sex,
      String username,
      @JsonKey(name: 'vizited_events') List<String?>? vizitedEvents,
      @JsonKey(name: 'registered_events') List<String?>? registeredEvents,
      @JsonKey(name: 'photo_url') String? photoUrl,
      @JsonKey(name: 'last_name') String lastName,
      List<String> clubs,
      int points});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? sex = freezed,
    Object? username = freezed,
    Object? vizitedEvents = freezed,
    Object? registeredEvents = freezed,
    Object? photoUrl = freezed,
    Object? lastName = freezed,
    Object? clubs = freezed,
    Object? points = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as UserType,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      sex: sex == freezed
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as String,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      vizitedEvents: vizitedEvents == freezed
          ? _value.vizitedEvents
          : vizitedEvents // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      registeredEvents: registeredEvents == freezed
          ? _value.registeredEvents
          : registeredEvents // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      clubs: clubs == freezed
          ? _value.clubs
          : clubs // ignore: cast_nullable_to_non_nullable
              as List<String>,
      points: points == freezed
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {UserType type,
      String id,
      @JsonKey(name: 'first_name') String name,
      String sex,
      String username,
      @JsonKey(name: 'vizited_events') List<String?>? vizitedEvents,
      @JsonKey(name: 'registered_events') List<String?>? registeredEvents,
      @JsonKey(name: 'photo_url') String? photoUrl,
      @JsonKey(name: 'last_name') String lastName,
      List<String> clubs,
      int points});
}

/// @nodoc
class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object? type = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? sex = freezed,
    Object? username = freezed,
    Object? vizitedEvents = freezed,
    Object? registeredEvents = freezed,
    Object? photoUrl = freezed,
    Object? lastName = freezed,
    Object? clubs = freezed,
    Object? points = freezed,
  }) {
    return _then(_User(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as UserType,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      sex: sex == freezed
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as String,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      vizitedEvents: vizitedEvents == freezed
          ? _value.vizitedEvents
          : vizitedEvents // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      registeredEvents: registeredEvents == freezed
          ? _value.registeredEvents
          : registeredEvents // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      clubs: clubs == freezed
          ? _value.clubs
          : clubs // ignore: cast_nullable_to_non_nullable
              as List<String>,
      points: points == freezed
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User implements _User {
  const _$_User(
      {required this.type,
      required this.id,
      @JsonKey(name: 'first_name') required this.name,
      required this.sex,
      required this.username,
      @JsonKey(name: 'vizited_events') this.vizitedEvents = const [],
      @JsonKey(name: 'registered_events') this.registeredEvents = const [],
      @JsonKey(name: 'photo_url') this.photoUrl,
      @JsonKey(name: 'last_name') required this.lastName,
      this.clubs = const [],
      required this.points});

  factory _$_User.fromJson(Map<String, dynamic> json) =>
      _$_$_UserFromJson(json);

  @override
  final UserType type;
  @override
  final String id;
  @override
  @JsonKey(name: 'first_name')
  final String name;
  @override
  final String sex;
  @override
  final String username;
  @override
  @JsonKey(name: 'vizited_events')
  final List<String?>? vizitedEvents;
  @override
  @JsonKey(name: 'registered_events')
  final List<String?>? registeredEvents;
  @override
  @JsonKey(name: 'photo_url')
  final String? photoUrl;
  @override
  @JsonKey(name: 'last_name')
  final String lastName;
  @JsonKey(defaultValue: const [])
  @override
  final List<String> clubs;
  @override
  final int points;

  @override
  String toString() {
    return 'User(type: $type, id: $id, name: $name, sex: $sex, username: $username, vizitedEvents: $vizitedEvents, registeredEvents: $registeredEvents, photoUrl: $photoUrl, lastName: $lastName, clubs: $clubs, points: $points)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _User &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.sex, sex) ||
                const DeepCollectionEquality().equals(other.sex, sex)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.vizitedEvents, vizitedEvents) ||
                const DeepCollectionEquality()
                    .equals(other.vizitedEvents, vizitedEvents)) &&
            (identical(other.registeredEvents, registeredEvents) ||
                const DeepCollectionEquality()
                    .equals(other.registeredEvents, registeredEvents)) &&
            (identical(other.photoUrl, photoUrl) ||
                const DeepCollectionEquality()
                    .equals(other.photoUrl, photoUrl)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.clubs, clubs) ||
                const DeepCollectionEquality().equals(other.clubs, clubs)) &&
            (identical(other.points, points) ||
                const DeepCollectionEquality().equals(other.points, points)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(sex) ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(vizitedEvents) ^
      const DeepCollectionEquality().hash(registeredEvents) ^
      const DeepCollectionEquality().hash(photoUrl) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(clubs) ^
      const DeepCollectionEquality().hash(points);

  @JsonKey(ignore: true)
  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserToJson(this);
  }
}

abstract class _User implements User {
  const factory _User(
      {required UserType type,
      required String id,
      @JsonKey(name: 'first_name') required String name,
      required String sex,
      required String username,
      @JsonKey(name: 'vizited_events') List<String?>? vizitedEvents,
      @JsonKey(name: 'registered_events') List<String?>? registeredEvents,
      @JsonKey(name: 'photo_url') String? photoUrl,
      @JsonKey(name: 'last_name') required String lastName,
      List<String> clubs,
      required int points}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  UserType get type => throw _privateConstructorUsedError;
  @override
  String get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'first_name')
  String get name => throw _privateConstructorUsedError;
  @override
  String get sex => throw _privateConstructorUsedError;
  @override
  String get username => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'vizited_events')
  List<String?>? get vizitedEvents => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'registered_events')
  List<String?>? get registeredEvents => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'photo_url')
  String? get photoUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'last_name')
  String get lastName => throw _privateConstructorUsedError;
  @override
  List<String> get clubs => throw _privateConstructorUsedError;
  @override
  int get points => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserCopyWith<_User> get copyWith => throw _privateConstructorUsedError;
}
