import 'package:get/get.dart';
import 'package:news_app/NewsApp/presentation/screens/HomePageView.dart';
import 'package:news_app/core/utils/HomeBinding.dart';


class Routes {
  static const String home = "/home";


  static List<GetPage> routes = [
        GetPage(
        name: home, page: () => const HomePageView(), binding:HomeBinding()),

  ];

}
