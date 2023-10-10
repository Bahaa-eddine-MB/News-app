import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt selectedIndex = 0.obs;





  void updateIndex(int index) {
    selectedIndex.value = index;
    update();
  }

}
