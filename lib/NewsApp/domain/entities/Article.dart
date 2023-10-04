import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final String sourceName;
  final String author;
  final String title;
  final String description;
  final String url;
  final String imageUrl;
  final DateTime publishedAt;
  final String content;

  Article({
    required this.sourceName,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.imageUrl,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      sourceName: json['source']['name'] ?? "",
      author: json['author'] ?? "",
      title: json['title'] ?? "",
      description: json['description'] ?? "",
      url: json['url'] ?? "",
      imageUrl: json['urlToImage'] ?? "",
      publishedAt: DateTime.parse(json['publishedAt'] ?? ""),
      content: json['content'] ?? "",
    );
  }

  @override
  List<Object?> get props => [
        sourceName,
        author,
        title,
        description,
        url,
        imageUrl,
        publishedAt,
        content
      ];
}
