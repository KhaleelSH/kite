import 'package:json_annotation/json_annotation.dart';

class EmptyStringToListJsonConverter implements JsonConverter<List<String>, Object?> {
  const EmptyStringToListJsonConverter();

  @override
  List<String> fromJson(Object? json) {
    if (json is String && json.isEmpty) {
      return [];
    } else if (json is List) {
      return json.cast<String>();
    } else {
      return [];
    }
  }

  @override
  Object toJson(List<String> object) => object;
}
