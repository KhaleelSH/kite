import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart';

@JsonSerializable()
class Article {
  Article({
    required this.title,
    required this.link,
    required this.domain,
    required this.date,
    required this.image,
    required this.imageCaption,
  });

  final String title;
  final String link;
  final String domain;
  final String date;
  final String image;
  final String imageCaption;

  factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);
}
