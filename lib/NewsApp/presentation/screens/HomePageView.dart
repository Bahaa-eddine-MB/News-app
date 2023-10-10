import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/NewsApp/presentation/screens/ArchiveView.dart';
import 'package:news_app/NewsApp/presentation/screens/HomeDetailsView.dart';
import 'package:news_app/NewsApp/presentation/screens/SearchView.dart';
import 'package:news_app/NewsApp/presentation/screens/TrendingView.dart';

import '../components/CustomButtonNavigatiomBar.dart';
import '../controllers/HomeController.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return IndexedStack(
            index: controller.selectedIndex.value,
            children: const [
              HomeDetailsView(),
              TrendingView(),
              SearchView(),
              ArchiveView(),
            ],
          );
        },
      ),
    );
  }
}
