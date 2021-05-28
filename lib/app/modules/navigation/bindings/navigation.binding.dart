import 'package:doan/app/modules/navigation/controllers/navigation.controller.dart';
import 'package:get/get.dart';

class NavigationBinding extends Bindings{
  void dependencies() {
    Get.lazyPut<NavigationController>(() => (NavigationController()));
  }
}