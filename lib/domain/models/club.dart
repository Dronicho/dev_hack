import 'package:freezed_annotation/freezed_annotation.dart';

import 'event.dart';

part 'club.freezed.dart';
part 'club.g.dart';

@freezed
class Club with _$Club {
  factory Club(
      {required String id,
      required String name,
      @Default(false) bool participaate,
      @JsonKey(ignore: true) List<Event>? incomingEvents,
      int? count,
      String? description,
      Attachment? logo,
      Attachment? backgroundImage}) = _Club;

  factory Club.fromJson(Map<String, dynamic> json) => _$ClubFromJson(json);
}
