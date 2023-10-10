import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/core/global/theme/ColorManager.dart';
import 'package:flutter_fadein/flutter_fadein.dart';

import '../screens/ArticleDetailView.dart';

class ArticleCard extends StatelessWidget {
  final String sourceName;
  final String author;
  final String title;
  final String description;
  final String url;
  final String imageUrl;
  final DateTime date;
  final String content;

  const ArticleCard({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.date,
    required this.author,
    required this.content,
    required this.sourceName,
    required this.url,
  });

  String truncateAuthor(String value) {
    if (value.length <= 15) {
      return value;
    } else {
      return value.substring(0, 15);
    }
  }

  @override
  Widget build(BuildContext context) {
    String truncatedAuthor = truncateAuthor(author);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: GestureDetector(
        onTap: () {
          Get.to(() => ArticleDetailView(
              title: title,
              description: description,
              content: content,
              imageUrl: imageUrl,
              publishedAt: "${date.day}/${date.month}/${date.year}"));
        },
        child: Card(
          color: Colors.grey[100],
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: FadeIn(
                    duration: const Duration(milliseconds: 500),
                    child: CachedNetworkImage(
                      height: 100,
                      width: 100,
                      imageUrl: imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8.0),
              SizedBox(
                width: Get.width * 0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: ColorManager.lightIconColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      content,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${date.day}/${date.month}/${date.year}",
                          style:
                              const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        Text(
                          truncatedAuthor,
                          style:
                              const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
