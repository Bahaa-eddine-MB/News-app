import 'package:get/get.dart';
import 'package:news_app/NewsApp/presentation/screens/ArticleDetailView.dart';
import 'package:news_app/NewsApp/presentation/screens/HomePageView.dart';
import 'package:news_app/core/utils/HomeBinding.dart';

class Routes {
  static const String home = "/home";
  static const String article = "/article";

  static List<GetPage> routes = [
    GetPage(
        name: home, page: () => const HomePageView(), binding: HomeBinding()),
    GetPage(
        name: article,
        page: () => const ArticleDetailView()),
  ];
}
