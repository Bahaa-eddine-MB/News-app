import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/core/global/theme/ColorManager.dart';

class ArticleCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final DateTime date;
  final String author;

  ArticleCard({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.date,
    required this.author,
  });

  String truncateAuthor(String value) {
    if (value.length <= 15) {
      return value; // No need to truncate if it's already 15 characters or less
    } else {
      return value.substring(0, 15); // Truncate to the first 15 characters
    }
  }

  @override
  Widget build(BuildContext context) {
    String truncatedAuthor = truncateAuthor(author);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Card(
        color: Colors.grey[100], // Gray background color
        child: Row(
          children: [
            // Left Image with Border Radius
            Container(
              margin: const EdgeInsets.all(8),
              width: 100, // Adjust the width as needed
              height: 100, // Adjust the height as needed
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0), // Border radius
                image: DecorationImage(
                  image: NetworkImage(
                      imageUrl), // You can use AssetImage or any image provider
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 8.0), // Add spacing between image and content
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
                    description,
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
    );
  }
}
