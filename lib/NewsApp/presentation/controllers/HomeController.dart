import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt selectedIndex = 1.obs;





  void updateIndex(int index) {
    selectedIndex.value = index;
    update();
  }

}
