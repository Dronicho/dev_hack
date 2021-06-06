// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'club.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Club _$ClubFromJson(Map<String, dynamic> json) {
  return _Club.fromJson(json);
}

/// @nodoc
class _$ClubTearOff {
  const _$ClubTearOff();

  _Club call(
      {required String id,
      required String name,
      bool participaate = false,
      @JsonKey(ignore: true) List<Event>? incomingEvents,
      int? count,
      String? description,
      Attachment? logo,
      Attachment? backgroundImage}) {
    return _Club(
      id: id,
      name: name,
      participaate: participaate,
      incomingEvents: incomingEvents,
      count: count,
      description: description,
      logo: logo,
      backgroundImage: backgroundImage,
    );
  }

  Club fromJson(Map<String, Object> json) {
    return Club.fromJson(json);
  }
}

/// @nodoc
const $Club = _$ClubTearOff();

/// @nodoc
mixin _$Club {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get participaate => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  List<Event>? get incomingEvents => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  Attachment? get logo => throw _privateConstructorUsedError;
  Attachment? get backgroundImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClubCopyWith<Club> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClubCopyWith<$Res> {
  factory $ClubCopyWith(Club value, $Res Function(Club) then) =
      _$ClubCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      bool participaate,
      @JsonKey(ignore: true) List<Event>? incomingEvents,
      int? count,
      String? description,
      Attachment? logo,
      Attachment? backgroundImage});

  $AttachmentCopyWith<$Res>? get logo;
  $AttachmentCopyWith<$Res>? get backgroundImage;
}

/// @nodoc
class _$ClubCopyWithImpl<$Res> implements $ClubCopyWith<$Res> {
  _$ClubCopyWithImpl(this._value, this._then);

  final Club _value;
  // ignore: unused_field
  final $Res Function(Club) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? participaate = freezed,
    Object? incomingEvents = freezed,
    Object? count = freezed,
    Object? description = freezed,
    Object? logo = freezed,
    Object? backgroundImage = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      participaate: participaate == freezed
          ? _value.participaate
          : participaate // ignore: cast_nullable_to_non_nullable
              as bool,
      incomingEvents: incomingEvents == freezed
          ? _value.incomingEvents
          : incomingEvents // ignore: cast_nullable_to_non_nullable
              as List<Event>?,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: logo == freezed
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as Attachment?,
      backgroundImage: backgroundImage == freezed
          ? _value.backgroundImage
          : backgroundImage // ignore: cast_nullable_to_non_nullable
              as Attachment?,
    ));
  }

  @override
  $AttachmentCopyWith<$Res>? get logo {
    if (_value.logo == null) {
      return null;
    }

    return $AttachmentCopyWith<$Res>(_value.logo!, (value) {
      return _then(_value.copyWith(logo: value));
    });
  }

  @override
  $AttachmentCopyWith<$Res>? get backgroundImage {
    if (_value.backgroundImage == null) {
      return null;
    }

    return $AttachmentCopyWith<$Res>(_value.backgroundImage!, (value) {
      return _then(_value.copyWith(backgroundImage: value));
    });
  }
}

/// @nodoc
abstract class _$ClubCopyWith<$Res> implements $ClubCopyWith<$Res> {
  factory _$ClubCopyWith(_Club value, $Res Function(_Club) then) =
      __$ClubCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      bool participaate,
      @JsonKey(ignore: true) List<Event>? incomingEvents,
      int? count,
      String? description,
      Attachment? logo,
      Attachment? backgroundImage});

  @override
  $AttachmentCopyWith<$Res>? get logo;
  @override
  $AttachmentCopyWith<$Res>? get backgroundImage;
}

/// @nodoc
class __$ClubCopyWithImpl<$Res> extends _$ClubCopyWithImpl<$Res>
    implements _$ClubCopyWith<$Res> {
  __$ClubCopyWithImpl(_Club _value, $Res Function(_Club) _then)
      : super(_value, (v) => _then(v as _Club));

  @override
  _Club get _value => super._value as _Club;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? participaate = freezed,
    Object? incomingEvents = freezed,
    Object? count = freezed,
    Object? description = freezed,
    Object? logo = freezed,
    Object? backgroundImage = freezed,
  }) {
    return _then(_Club(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      participaate: participaate == freezed
          ? _value.participaate
          : participaate // ignore: cast_nullable_to_non_nullable
              as bool,
      incomingEvents: incomingEvents == freezed
          ? _value.incomingEvents
          : incomingEvents // ignore: cast_nullable_to_non_nullable
              as List<Event>?,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: logo == freezed
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as Attachment?,
      backgroundImage: backgroundImage == freezed
          ? _value.backgroundImage
          : backgroundImage // ignore: cast_nullable_to_non_nullable
              as Attachment?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Club implements _Club {
  _$_Club(
      {required this.id,
      required this.name,
      this.participaate = false,
      @JsonKey(ignore: true) this.incomingEvents,
      this.count,
      this.description,
      this.logo,
      this.backgroundImage});

  factory _$_Club.fromJson(Map<String, dynamic> json) =>
      _$_$_ClubFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @JsonKey(defaultValue: false)
  @override
  final bool participaate;
  @override
  @JsonKey(ignore: true)
  final List<Event>? incomingEvents;
  @override
  final int? count;
  @override
  final String? description;
  @override
  final Attachment? logo;
  @override
  final Attachment? backgroundImage;

  @override
  String toString() {
    return 'Club(id: $id, name: $name, participaate: $participaate, incomingEvents: $incomingEvents, count: $count, description: $description, logo: $logo, backgroundImage: $backgroundImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Club &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.participaate, participaate) ||
                const DeepCollectionEquality()
                    .equals(other.participaate, participaate)) &&
            (identical(other.incomingEvents, incomingEvents) ||
                const DeepCollectionEquality()
                    .equals(other.incomingEvents, incomingEvents)) &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.logo, logo) ||
                const DeepCollectionEquality().equals(other.logo, logo)) &&
            (identical(other.backgroundImage, backgroundImage) ||
                const DeepCollectionEquality()
                    .equals(other.backgroundImage, backgroundImage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(participaate) ^
      const DeepCollectionEquality().hash(incomingEvents) ^
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(logo) ^
      const DeepCollectionEquality().hash(backgroundImage);

  @JsonKey(ignore: true)
  @override
  _$ClubCopyWith<_Club> get copyWith =>
      __$ClubCopyWithImpl<_Club>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ClubToJson(this);
  }
}

abstract class _Club implements Club {
  factory _Club(
      {required String id,
      required String name,
      bool participaate,
      @JsonKey(ignore: true) List<Event>? incomingEvents,
      int? count,
      String? description,
      Attachment? logo,
      Attachment? backgroundImage}) = _$_Club;

  factory _Club.fromJson(Map<String, dynamic> json) = _$_Club.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  bool get participaate => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  List<Event>? get incomingEvents => throw _privateConstructorUsedError;
  @override
  int? get count => throw _privateConstructorUsedError;
  @override
  String? get description => throw _privateConstructorUsedError;
  @override
  Attachment? get logo => throw _privateConstructorUsedError;
  @override
  Attachment? get backgroundImage => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ClubCopyWith<_Club> get copyWith => throw _privateConstructorUsedError;
}
