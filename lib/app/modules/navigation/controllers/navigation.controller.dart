import 'package:get/get.dart';
class NavigationController extends GetxController {

  static RxInt currentIndex = RxInt(0);

  void selectedIndex(int index){
    currentIndex.value = index;
    update();
  }

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() async {
    super.onClose();
  }
}