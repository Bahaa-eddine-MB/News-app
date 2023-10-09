import 'package:flutter/material.dart';

class MainArticleCard extends StatelessWidget {
  final String sourceName;
  final String author;
  final String title;
  final String description;
  final String url;
  final String imageUrl;
  final DateTime publishedAt;
  final String content;

  const MainArticleCard({
    Key? key,
    required this.sourceName,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.imageUrl,
    required this.publishedAt,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 15), // Set your desired fixed height here
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
          image: DecorationImage(
            image: NetworkImage(imageUrl), // Load the image from the URL
            fit: BoxFit.cover, // Adjust the fit as needed
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end, // Align text to the bottom
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration:  BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              // Black with some opacity for shadow
              padding:
                  const EdgeInsets.all(8.0), // Adjust the padding as needed
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18, // Adjust the font size as needed
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Set text color to white
                    ),
                  ),
                  const SizedBox(
                      height: 8), // Add spacing between title and description
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14, // Adjust the font size as needed
                      color: Colors.white, // Set text color to white
                    ),
                    maxLines: 2, // Limit description to 2 lines
                    overflow: TextOverflow
                        .ellipsis, // Add ellipsis (...) for overflow
                  ),
                  const SizedBox(
                      height:
                          8), // Add spacing between description and other content
                  Text(
                    'Source: $sourceName',
                    style: const TextStyle(
                      fontSize: 12, // Adjust the font size as needed
                      fontStyle: FontStyle.italic,
                      color: Colors.white, // Set text color to white
                    ),
                  ),
                  const SizedBox(
                      height:
                          8), // Add spacing between source and other content
                  Text(
                    'Author: $author',
                    style: const TextStyle(
                      fontSize: 12, // Adjust the font size as needed
                      fontStyle: FontStyle.italic,
                      color: Colors.white, // Set text color to white
                    ),
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
