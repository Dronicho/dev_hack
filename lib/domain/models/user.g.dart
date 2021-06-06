// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  return _$_User(
    type: _$enumDecode(_$UserTypeEnumMap, json['type']),
    id: json['id'] as String,
    name: json['first_name'] as String,
    sex: json['sex'] as String,
    username: json['username'] as String,
    vizitedEvents: (json['vizited_events'] as List<dynamic>?)
        ?.map((e) => e as String?)
        .toList(),
    registeredEvents: (json['registered_events'] as List<dynamic>?)
        ?.map((e) => e as String?)
        .toList(),
    photoUrl: json['photo_url'] as String?,
    lastName: json['last_name'] as String,
    clubs:
        (json['clubs'] as List<dynamic>?)?.map((e) => e as String).toList() ??
            [],
    points: json['points'] as int,
  );
}

Map<String, dynamic> _$_$_UserToJson(_$_User instance) => <String, dynamic>{
      'type': _$UserTypeEnumMap[instance.type],
      'id': instance.id,
      'first_name': instance.name,
      'sex': instance.sex,
      'username': instance.username,
      'vizited_events': instance.vizitedEvents,
      'registered_events': instance.registeredEvents,
      'photo_url': instance.photoUrl,
      'last_name': instance.lastName,
      'clubs': instance.clubs,
      'points': instance.points,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$UserTypeEnumMap = {
  UserType.stuff: 'stuff',
  UserType.coach: 'coach',
};
