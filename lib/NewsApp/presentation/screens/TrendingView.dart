import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/NewsApp/presentation/components/TrendingArticle.dart';
import 'package:news_app/NewsApp/presentation/controllers/PopularArticlesController.dart';
import 'package:news_app/NewsApp/presentation/controllers/TopCrunchHeadlinesController.dart';
import 'package:news_app/core/utils/AppString.dart';
import '../components/ArticleCard.dart';
import '../components/ErrorToast.dart';

class TrendingView extends StatelessWidget {
  const TrendingView({super.key});

  @override
  Widget build(BuildContext context) {
    final PopulerArticlesController populerArticlesController =
        Get.put(PopulerArticlesController());
    final TopCrunchHeadlineController topCrunchHeadlineController =
        Get.put(TopCrunchHeadlineController());
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
            child: Text(
              AppString.walkTrend,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
            child: Text(
              AppString.topReads,
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(
            height: 280,
            child: GetBuilder<TopCrunchHeadlineController>(builder: (context) {
              if (topCrunchHeadlineController.loading == true) {
                return Center(
                    child: Lottie.asset('assets/lottie/loading.json'));
              } else if (topCrunchHeadlineController.loading == false &&
                  topCrunchHeadlineController.error == true) {
                return ErrorToast(callback: () {
                  topCrunchHeadlineController.tryAgain();
                });
              } else {
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  itemCount: topCrunchHeadlineController.articles.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) {
                    final article = topCrunchHeadlineController.articles[index];
                    if (article.imageUrl != "") {
                      return TrendingArticleCard(
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
                    return const SizedBox();
                  }),
                );
              }
            }),
          ),
          const SizedBox(
            height: 15,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
            child: Text(
              AppString.palastine,
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
                      sourceName: article.sourceName,
                      url: article.url,
                      content: article.content,
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
