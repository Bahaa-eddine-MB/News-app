import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/NewsApp/presentation/components/ArticleCard.dart';
import 'package:news_app/NewsApp/presentation/components/CategoryWidget.dart';
import 'package:news_app/NewsApp/presentation/components/MainArticleCard.dart';
import 'package:news_app/NewsApp/presentation/controllers/HomeDetailsController.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/NewsApp/presentation/controllers/TopHeadlineController.dart';
import 'package:news_app/core/global/theme/ColorManager.dart';
import '../components/ErrorToast.dart';

class HomeDetailsView extends StatelessWidget {
  const HomeDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeDetailsController homeDetailsController =
        Get.put(HomeDetailsController());

    final TopHeadlinesController topHeadlinesController =
        Get.put(TopHeadlinesController());
    return Scaffold(
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
              "Top wallstreet articles !",
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
                    return const SizedBox();
                  }),
                );
              }
            }),
          ),
          SizedBox(
              height: 100,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 25),
                itemCount: homeDetailsController.categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  final category = homeDetailsController.categories[index];
                  return GetBuilder<HomeDetailsController>(builder: (context) {
                    return CategoryCard(
                      onTap: () {
                        homeDetailsController.setSelectedCategory(index);
                        topHeadlinesController.category =
                            topHeadlinesController.categories[index];
                        topHeadlinesController.tryAgain();
                      },
                      isSelected:
                          index == homeDetailsController.selectedCategory,
                      text: category,
                    );
                  });
                }),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Country :",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  width: 10,
                ),
                GetBuilder<TopHeadlinesController>(builder: (context) {
                  return DropdownButton<String>(
                    value: topHeadlinesController.country,
                    isExpanded: false,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    dropdownColor: Colors.white,
                    underline:
                        Container(height: 2, color: ColorManager.primary),
                    onChanged: (value) {
                      topHeadlinesController.setCountry(value!);
                      topHeadlinesController.tryAgain();
                    },
                    items:
                        topHeadlinesController.countries.map((Country country) {
                      return DropdownMenuItem<String>(
                        value: country.code, 
                        child: Text(country.name),
                      );
                    }).toList(),
                  );
                }),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          GetBuilder<TopHeadlinesController>(builder: (context) {
            if (topHeadlinesController.loading == true) {
              return Center(child: Lottie.asset('assets/lottie/loading.json'));
            } else if (topHeadlinesController.loading == false &&
                topHeadlinesController.error == true) {
              return ErrorToast(callback: () {
                topHeadlinesController.tryAgain();
              });
            } else {
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: topHeadlinesController.articles.length,
                itemBuilder: ((context, index) {
                  final article = topHeadlinesController.articles[index];
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
