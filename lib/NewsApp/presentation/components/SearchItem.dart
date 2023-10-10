import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/ArticleDetailView.dart';

class SearchItemCard extends StatelessWidget {
  final String sourceName;
  final String author;
  final String title;
  final String description;
  final String url;
  final String imageUrl;
  final DateTime publishedAt;
  final String content;

  const SearchItemCard({
    required this.imageUrl,
    required this.title,
    required this.sourceName,
    required this.author,
    required this.description,
    required this.url,
    required this.publishedAt,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: GestureDetector(
        onTap: () {
          Get.to(() => ArticleDetailView(
              title: title,
              description: description,
              content: content,
              imageUrl: imageUrl,
              publishedAt:
                  "${publishedAt.day}/${publishedAt.month}/${publishedAt.year}"));
        },
        child: Card(
          color: Colors.grey[100],
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: CachedNetworkImage(
                    height: 50,
                    width: 50,
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 8.0),
              SizedBox(
                width: Get.width * 0.6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
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
