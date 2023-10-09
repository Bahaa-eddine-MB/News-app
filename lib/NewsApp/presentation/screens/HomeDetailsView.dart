import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/NewsApp/domain/entities/Article.dart';
import 'package:news_app/NewsApp/presentation/components/MainArticleCard.dart';
import 'package:news_app/NewsApp/presentation/controllers/HomeDetailsController.dart';
import 'package:lottie/lottie.dart';
import '../components/ErrorToast.dart';

class HomeDetailsView extends StatelessWidget {
  const HomeDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeDetailsController homeDetailsController =
        Get.put(HomeDetailsController());
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
            child: Text(
              "Good morning",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
            child: Text(
              "Explore the world by one click !",
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(
            height: 280,
            child: GetBuilder<HomeDetailsController>(builder: (context) {
              if (homeDetailsController.loading == true) {
                return Center(
                    child: Lottie.asset('assets/lottie/loading.json'));
              } else if (homeDetailsController.loading == false &&
                  homeDetailsController.error == true) {
                return ErrorToast(callback: () {
                  homeDetailsController.tryAgain();
                });
              } else {
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  itemCount: homeDetailsController.articles.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) {
                    final article = homeDetailsController.articles[index];
                    if (article.imageUrl != "") {
                      return MainArticleCard(
                        author: article.author,
                        content: article.content,
                        description: article.description,
                        imageUrl: article.imageUrl,
                        publishedAt: article.publishedAt,
                        sourceName: article.sourceName,
                        title: article.title,
                        url: article.url,
                      );
                    }
                  }),
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
