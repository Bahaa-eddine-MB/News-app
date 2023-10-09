import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/core/utils/AppString.dart';
import 'NewsApp/presentation/RouteManager.dart';
import 'core/global/theme/ThemeManager.dart';
import 'core/service/serviceLocator.dart';

void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppString.appName,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.home,
      theme: getApplicationThemData(),
      getPages: Routes.routes,
    );
  }
}
