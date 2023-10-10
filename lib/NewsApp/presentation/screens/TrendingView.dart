import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/NewsApp/presentation/controllers/PopularArticlesController.dart';

import '../components/ArticleCard.dart';
import '../components/ErrorToast.dart';

class TrendingView extends StatelessWidget {
  const TrendingView({super.key});

  @override
  Widget build(BuildContext context) {
    final PopulerArticlesController populerArticlesController =
        Get.put(PopulerArticlesController());
    return Scaffold(
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
            child: Text(
              "Walk with Trend",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
            child: Text(
              "Top reads of the day !",
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          GetBuilder<PopulerArticlesController>(builder: (context) {
            if (populerArticlesController.loading == true) {
              return Center(child: Lottie.asset('assets/lottie/loading.json'));
            } else if (populerArticlesController.loading == false &&
                populerArticlesController.error == true) {
              return ErrorToast(callback: () {
                populerArticlesController.tryAgain();
              });
            } else {
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: populerArticlesController.articles.length,
                itemBuilder: ((context, index) {
                  final article = populerArticlesController.articles[index];
                  if (article.imageUrl != "") {
                    return ArticleCard(
                      author: article.author,
                      description: article.description,
                      imageUrl: article.imageUrl,
                      date: article.publishedAt,
                      title: article.title,
                    );
                  }
                  return const SizedBox();
                }),
              );
            }
          }),
        ],
      ),
    );
  }
}
