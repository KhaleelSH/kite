import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  Category({required this.name, required this.file});

  final String name;
  final String file;

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
}
