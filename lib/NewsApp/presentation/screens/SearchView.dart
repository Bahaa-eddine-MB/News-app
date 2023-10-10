import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/NewsApp/presentation/components/SearchItem.dart';
import 'package:news_app/NewsApp/presentation/controllers/SearchController.dart';
import 'package:news_app/core/utils/AppString.dart';
import '../../../../core/global/theme/ColorManager.dart';
import '../components/ErrorToast.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    final SearchController searchController = Get.put(SearchController());
    return Scaffold(
      appBar: AppBar(
        title: Card(
          child: TextField(
            onChanged: searchController.setSearch,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10.0),
              ),
              hintText:AppString.search,
              suffixIcon: const Icon(
                Icons.search,
                size: 25,
              ),
            ),
          ),
        ),
      ),
      body: GetBuilder<SearchController>(builder: (context) {
        if (searchController.query == "") {
          return Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset('assets/lottie/search.json',
                      height: Get.height * 0.3),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
               AppString.searchForSmt,
                style: TextStyle(color: ColorManager.lightTextColor),
              )
            ],
          );
        }
        if (searchController.loading == true) {
          return Center(child: Lottie.asset('assets/lottie/loading.json'));
        } else if (searchController.error == true) {
          return ErrorToast(callback: () {
            searchController.tryAgain();
          });
        } else {
          if (searchController.articles.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Lottie.asset('assets/lottie/nothing.json', height: 200),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    AppString.nothing,
                    style: TextStyle(color: ColorManager.grayColor),
                  )
                ],
              ),
            );
          } else {
            return ListView.builder(
              itemCount: searchController.articles.length + 1,
              itemBuilder: ((context, index) {
                final article = searchController.articles;

                if (article[index].imageUrl != "") {
                  return SearchItemCard(
                    author: article[index].author,
                    content: article[index].content,
                    description: article[index].description,
                    publishedAt: article[index].publishedAt,
                    sourceName: article[index].sourceName,
                    url: article[index].url,
                    imageUrl: article[index].imageUrl,
                    title: article[index].title,
                  );
                } else {
                  return const SizedBox();
                }
              }),
            );
          }
        }
      }),
    );
  }
}
