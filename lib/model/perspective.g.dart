// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perspective.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Perspective _$PerspectiveFromJson(Map<String, dynamic> json) => Perspective(
  text: json['text'] as String,
  sources: (json['sources'] as List<dynamic>)
      .map((e) => PerspectiveSource.fromJson(e as Map<String, dynamic>))
      .toList(),
);

PerspectiveSource _$PerspectiveSourceFromJson(Map<String, dynamic> json) =>
    PerspectiveSource(name: json['name'] as String, url: json['url'] as String);
