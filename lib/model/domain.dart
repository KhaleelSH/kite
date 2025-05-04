import 'package:json_annotation/json_annotation.dart';

part 'domain.g.dart';

@JsonSerializable()
class Domain {
  const Domain({required this.name, required this.favicon});

  final String name;
  final String favicon;

  factory Domain.fromJson(Map<String, dynamic> json) => _$DomainFromJson(json);
}
