import 'package:get/get.dart';
import 'package:news_app/NewsApp/presentation/controllers/HomeController.dart';


class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(()=>HomeController());
  }
}
