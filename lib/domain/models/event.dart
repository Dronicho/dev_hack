import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';
part 'event.g.dart';

@freezed
class Event with _$Event {
  @JsonSerializable(includeIfNull: false)
  factory Event(
      {required String name,
      String? id,
      String? location,
      Attachment? attachment,
      required DateTime date,
      @Default([]) List<String> clubs,
      @Default(false) bool participate,
      @Default(EventType.competition) EventType type,
      String? url,
      int? periodic,
      int? count,
      int? duration,
      String? description,
      List<Attachment?>? attachments}) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  Map<String, dynamic> toJson() => {
        'name': name,
        'location': location,
        'clubs': clubs,
        'attachment': null,
        'url': attachment?.url ?? null,
        'date': date.toUtc().toIso8601String(),
        'type': type.toString().split('.')[1],
        'description': description,
        'periodic': periodic,
        'duration': duration,
      };
}

enum EventType { competition, training }

@freezed
class Attachment with _$Attachment {
  factory Attachment({required String id, required String url}) = _Attachment;

  factory Attachment.fromJson(Map<String, dynamic> json) =>
      _$AttachmentFromJson(json);
}
