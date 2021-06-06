// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Event _$_$_EventFromJson(Map<String, dynamic> json) {
  return _$_Event(
    name: json['name'] as String,
    id: json['id'] as String?,
    location: json['location'] as String?,
    attachment: json['attachment'] == null
        ? null
        : Attachment.fromJson(json['attachment'] as Map<String, dynamic>),
    date: DateTime.parse(json['date'] as String),
    clubs:
        (json['clubs'] as List<dynamic>?)?.map((e) => e as String).toList() ??
            [],
    participate: json['participate'] as bool? ?? false,
    type: _$enumDecodeNullable(_$EventTypeEnumMap, json['type']) ??
        EventType.competition,
    url: json['url'] as String?,
    periodic: json['periodic'] as int?,
    count: json['count'] as int?,
    duration: json['duration'] as int?,
    description: json['description'] as String?,
    attachments: (json['attachments'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : Attachment.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_EventToJson(_$_Event instance) {
  final val = <String, dynamic>{
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('location', instance.location);
  writeNotNull('attachment', instance.attachment);
  val['date'] = instance.date.toIso8601String();
  val['clubs'] = instance.clubs;
  val['participate'] = instance.participate;
  val['type'] = _$EventTypeEnumMap[instance.type];
  writeNotNull('url', instance.url);
  writeNotNull('periodic', instance.periodic);
  writeNotNull('count', instance.count);
  writeNotNull('duration', instance.duration);
  writeNotNull('description', instance.description);
  writeNotNull('attachments', instance.attachments);
  return val;
}

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

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$EventTypeEnumMap = {
  EventType.competition: 'competition',
  EventType.training: 'training',
};

_$_Attachment _$_$_AttachmentFromJson(Map<String, dynamic> json) {
  return _$_Attachment(
    id: json['id'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$_$_AttachmentToJson(_$_Attachment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
    };
