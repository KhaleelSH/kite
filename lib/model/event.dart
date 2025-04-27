import 'package:json_annotation/json_annotation.dart';

part 'event.g.dart';

@JsonSerializable()
class Event {
  Event({required this.year, required this.content, required this.sortYear, required this.type});

  final String year;
  final String content;
  final double sortYear;
  final EventType type;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}

enum EventType { event, people }
