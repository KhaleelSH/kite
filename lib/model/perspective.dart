import 'package:json_annotation/json_annotation.dart';

part 'perspective.g.dart';

@JsonSerializable()
class Perspective {
  Perspective({required this.text, required this.sources});

  final String text;
  final List<PerspectiveSource> sources;

  factory Perspective.fromJson(Map<String, dynamic> json) => _$PerspectiveFromJson(json);
}

@JsonSerializable()
class PerspectiveSource {
  PerspectiveSource({required this.name, required this.url});

  final String name;
  final String url;

  factory PerspectiveSource.fromJson(Map<String, dynamic> json) => _$PerspectiveSourceFromJson(json);
}
