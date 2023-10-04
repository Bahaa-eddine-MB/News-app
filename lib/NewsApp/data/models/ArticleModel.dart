import 'package:news_app/NewsApp/domain/entities/Article.dart';

class ArticleModel extends Article {
  ArticleModel(
      {required super.sourceName,
      required super.author,
      required super.title,
      required super.description,
      required super.url,
      required super.imageUrl,
      required super.publishedAt,
      required super.content});

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      sourceName: json["source"]?["name"] ?? "",
      author: json["author"] ?? "",
      title: json["title"] ?? "",
      description: json["description"] ?? "",
      url: json["url"] ?? "",
      imageUrl: json["urlToImage"] ?? "",
      publishedAt: DateTime.parse(json["publishedAt"] ?? ""),
      content: json["content"] ?? "",
    );
  } 
}
