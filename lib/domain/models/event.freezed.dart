// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Event _$EventFromJson(Map<String, dynamic> json) {
  return _Event.fromJson(json);
}

/// @nodoc
class _$EventTearOff {
  const _$EventTearOff();

  _Event call(
      {required String name,
      String? id,
      String? location,
      Attachment? attachment,
      required DateTime date,
      List<String> clubs = const [],
      bool participate = false,
      EventType type = EventType.competition,
      String? url,
      int? periodic,
      int? count,
      int? duration,
      String? description,
      List<Attachment?>? attachments}) {
    return _Event(
      name: name,
      id: id,
      location: location,
      attachment: attachment,
      date: date,
      clubs: clubs,
      participate: participate,
      type: type,
      url: url,
      periodic: periodic,
      count: count,
      duration: duration,
      description: description,
      attachments: attachments,
    );
  }

  Event fromJson(Map<String, Object> json) {
    return Event.fromJson(json);
  }
}

/// @nodoc
const $Event = _$EventTearOff();

/// @nodoc
mixin _$Event {
  String get name => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  Attachment? get attachment => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  List<String> get clubs => throw _privateConstructorUsedError;
  bool get participate => throw _privateConstructorUsedError;
  EventType get type => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  int? get periodic => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;
  int? get duration => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<Attachment?>? get attachments => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventCopyWith<Event> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventCopyWith<$Res> {
  factory $EventCopyWith(Event value, $Res Function(Event) then) =
      _$EventCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String? id,
      String? location,
      Attachment? attachment,
      DateTime date,
      List<String> clubs,
      bool participate,
      EventType type,
      String? url,
      int? periodic,
      int? count,
      int? duration,
      String? description,
      List<Attachment?>? attachments});

  $AttachmentCopyWith<$Res>? get attachment;
}

/// @nodoc
class _$EventCopyWithImpl<$Res> implements $EventCopyWith<$Res> {
  _$EventCopyWithImpl(this._value, this._then);

  final Event _value;
  // ignore: unused_field
  final $Res Function(Event) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? id = freezed,
    Object? location = freezed,
    Object? attachment = freezed,
    Object? date = freezed,
    Object? clubs = freezed,
    Object? participate = freezed,
    Object? type = freezed,
    Object? url = freezed,
    Object? periodic = freezed,
    Object? count = freezed,
    Object? duration = freezed,
    Object? description = freezed,
    Object? attachments = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      attachment: attachment == freezed
          ? _value.attachment
          : attachment // ignore: cast_nullable_to_non_nullable
              as Attachment?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      clubs: clubs == freezed
          ? _value.clubs
          : clubs // ignore: cast_nullable_to_non_nullable
              as List<String>,
      participate: participate == freezed
          ? _value.participate
          : participate // ignore: cast_nullable_to_non_nullable
              as bool,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EventType,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      periodic: periodic == freezed
          ? _value.periodic
          : periodic // ignore: cast_nullable_to_non_nullable
              as int?,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      attachments: attachments == freezed
          ? _value.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<Attachment?>?,
    ));
  }

  @override
  $AttachmentCopyWith<$Res>? get attachment {
    if (_value.attachment == null) {
      return null;
    }

    return $AttachmentCopyWith<$Res>(_value.attachment!, (value) {
      return _then(_value.copyWith(attachment: value));
    });
  }
}

/// @nodoc
abstract class _$EventCopyWith<$Res> implements $EventCopyWith<$Res> {
  factory _$EventCopyWith(_Event value, $Res Function(_Event) then) =
      __$EventCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String? id,
      String? location,
      Attachment? attachment,
      DateTime date,
      List<String> clubs,
      bool participate,
      EventType type,
      String? url,
      int? periodic,
      int? count,
      int? duration,
      String? description,
      List<Attachment?>? attachments});

  @override
  $AttachmentCopyWith<$Res>? get attachment;
}

/// @nodoc
class __$EventCopyWithImpl<$Res> extends _$EventCopyWithImpl<$Res>
    implements _$EventCopyWith<$Res> {
  __$EventCopyWithImpl(_Event _value, $Res Function(_Event) _then)
      : super(_value, (v) => _then(v as _Event));

  @override
  _Event get _value => super._value as _Event;

  @override
  $Res call({
    Object? name = freezed,
    Object? id = freezed,
    Object? location = freezed,
    Object? attachment = freezed,
    Object? date = freezed,
    Object? clubs = freezed,
    Object? participate = freezed,
    Object? type = freezed,
    Object? url = freezed,
    Object? periodic = freezed,
    Object? count = freezed,
    Object? duration = freezed,
    Object? description = freezed,
    Object? attachments = freezed,
  }) {
    return _then(_Event(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      attachment: attachment == freezed
          ? _value.attachment
          : attachment // ignore: cast_nullable_to_non_nullable
              as Attachment?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      clubs: clubs == freezed
          ? _value.clubs
          : clubs // ignore: cast_nullable_to_non_nullable
              as List<String>,
      participate: participate == freezed
          ? _value.participate
          : participate // ignore: cast_nullable_to_non_nullable
              as bool,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EventType,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      periodic: periodic == freezed
          ? _value.periodic
          : periodic // ignore: cast_nullable_to_non_nullable
              as int?,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      attachments: attachments == freezed
          ? _value.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<Attachment?>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$_Event implements _Event {
  _$_Event(
      {required this.name,
      this.id,
      this.location,
      this.attachment,
      required this.date,
      this.clubs = const [],
      this.participate = false,
      this.type = EventType.competition,
      this.url,
      this.periodic,
      this.count,
      this.duration,
      this.description,
      this.attachments});

  factory _$_Event.fromJson(Map<String, dynamic> json) =>
      _$_$_EventFromJson(json);

  @override
  final String name;
  @override
  final String? id;
  @override
  final String? location;
  @override
  final Attachment? attachment;
  @override
  final DateTime date;
  @JsonKey(defaultValue: const [])
  @override
  final List<String> clubs;
  @JsonKey(defaultValue: false)
  @override
  final bool participate;
  @JsonKey(defaultValue: EventType.competition)
  @override
  final EventType type;
  @override
  final String? url;
  @override
  final int? periodic;
  @override
  final int? count;
  @override
  final int? duration;
  @override
  final String? description;
  @override
  final List<Attachment?>? attachments;

  @override
  String toString() {
    return 'Event(name: $name, id: $id, location: $location, attachment: $attachment, date: $date, clubs: $clubs, participate: $participate, type: $type, url: $url, periodic: $periodic, count: $count, duration: $duration, description: $description, attachments: $attachments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Event &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)) &&
            (identical(other.attachment, attachment) ||
                const DeepCollectionEquality()
                    .equals(other.attachment, attachment)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.clubs, clubs) ||
                const DeepCollectionEquality().equals(other.clubs, clubs)) &&
            (identical(other.participate, participate) ||
                const DeepCollectionEquality()
                    .equals(other.participate, participate)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.periodic, periodic) ||
                const DeepCollectionEquality()
                    .equals(other.periodic, periodic)) &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.attachments, attachments) ||
                const DeepCollectionEquality()
                    .equals(other.attachments, attachments)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(location) ^
      const DeepCollectionEquality().hash(attachment) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(clubs) ^
      const DeepCollectionEquality().hash(participate) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(periodic) ^
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(attachments);

  @JsonKey(ignore: true)
  @override
  _$EventCopyWith<_Event> get copyWith =>
      __$EventCopyWithImpl<_Event>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_EventToJson(this);
  }
}

abstract class _Event implements Event {
  factory _Event(
      {required String name,
      String? id,
      String? location,
      Attachment? attachment,
      required DateTime date,
      List<String> clubs,
      bool participate,
      EventType type,
      String? url,
      int? periodic,
      int? count,
      int? duration,
      String? description,
      List<Attachment?>? attachments}) = _$_Event;

  factory _Event.fromJson(Map<String, dynamic> json) = _$_Event.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get location => throw _privateConstructorUsedError;
  @override
  Attachment? get attachment => throw _privateConstructorUsedError;
  @override
  DateTime get date => throw _privateConstructorUsedError;
  @override
  List<String> get clubs => throw _privateConstructorUsedError;
  @override
  bool get participate => throw _privateConstructorUsedError;
  @override
  EventType get type => throw _privateConstructorUsedError;
  @override
  String? get url => throw _privateConstructorUsedError;
  @override
  int? get periodic => throw _privateConstructorUsedError;
  @override
  int? get count => throw _privateConstructorUsedError;
  @override
  int? get duration => throw _privateConstructorUsedError;
  @override
  String? get description => throw _privateConstructorUsedError;
  @override
  List<Attachment?>? get attachments => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$EventCopyWith<_Event> get copyWith => throw _privateConstructorUsedError;
}

Attachment _$AttachmentFromJson(Map<String, dynamic> json) {
  return _Attachment.fromJson(json);
}

/// @nodoc
class _$AttachmentTearOff {
  const _$AttachmentTearOff();

  _Attachment call({required String id, required String url}) {
    return _Attachment(
      id: id,
      url: url,
    );
  }

  Attachment fromJson(Map<String, Object> json) {
    return Attachment.fromJson(json);
  }
}

/// @nodoc
const $Attachment = _$AttachmentTearOff();

/// @nodoc
mixin _$Attachment {
  String get id => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttachmentCopyWith<Attachment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttachmentCopyWith<$Res> {
  factory $AttachmentCopyWith(
          Attachment value, $Res Function(Attachment) then) =
      _$AttachmentCopyWithImpl<$Res>;
  $Res call({String id, String url});
}

/// @nodoc
class _$AttachmentCopyWithImpl<$Res> implements $AttachmentCopyWith<$Res> {
  _$AttachmentCopyWithImpl(this._value, this._then);

  final Attachment _value;
  // ignore: unused_field
  final $Res Function(Attachment) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$AttachmentCopyWith<$Res> implements $AttachmentCopyWith<$Res> {
  factory _$AttachmentCopyWith(
          _Attachment value, $Res Function(_Attachment) then) =
      __$AttachmentCopyWithImpl<$Res>;
  @override
  $Res call({String id, String url});
}

/// @nodoc
class __$AttachmentCopyWithImpl<$Res> extends _$AttachmentCopyWithImpl<$Res>
    implements _$AttachmentCopyWith<$Res> {
  __$AttachmentCopyWithImpl(
      _Attachment _value, $Res Function(_Attachment) _then)
      : super(_value, (v) => _then(v as _Attachment));

  @override
  _Attachment get _value => super._value as _Attachment;

  @override
  $Res call({
    Object? id = freezed,
    Object? url = freezed,
  }) {
    return _then(_Attachment(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Attachment implements _Attachment {
  _$_Attachment({required this.id, required this.url});

  factory _$_Attachment.fromJson(Map<String, dynamic> json) =>
      _$_$_AttachmentFromJson(json);

  @override
  final String id;
  @override
  final String url;

  @override
  String toString() {
    return 'Attachment(id: $id, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Attachment &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(url);

  @JsonKey(ignore: true)
  @override
  _$AttachmentCopyWith<_Attachment> get copyWith =>
      __$AttachmentCopyWithImpl<_Attachment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AttachmentToJson(this);
  }
}

abstract class _Attachment implements Attachment {
  factory _Attachment({required String id, required String url}) =
      _$_Attachment;

  factory _Attachment.fromJson(Map<String, dynamic> json) =
      _$_Attachment.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get url => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AttachmentCopyWith<_Attachment> get copyWith =>
      throw _privateConstructorUsedError;
}
