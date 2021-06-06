// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'club.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Club _$_$_ClubFromJson(Map<String, dynamic> json) {
  return _$_Club(
    id: json['id'] as String,
    name: json['name'] as String,
    participaate: json['participaate'] as bool? ?? false,
    count: json['count'] as int?,
    description: json['description'] as String?,
    logo: json['logo'] == null
        ? null
        : Attachment.fromJson(json['logo'] as Map<String, dynamic>),
    backgroundImage: json['backgroundImage'] == null
        ? null
        : Attachment.fromJson(json['backgroundImage'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_ClubToJson(_$_Club instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'participaate': instance.participaate,
      'count': instance.count,
      'description': instance.description,
      'logo': instance.logo,
      'backgroundImage': instance.backgroundImage,
    };
