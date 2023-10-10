import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/core/utils/AppString.dart';
import 'NewsApp/presentation/RouteManager.dart';
import 'core/global/theme/ThemeManager.dart';
import 'core/service/serviceLocator.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  ServicesLocator().init();
  runApp(const MyApp());
  FlutterNativeSplash.remove();
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
