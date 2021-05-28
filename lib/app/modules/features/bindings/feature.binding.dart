import 'package:doan/app/modules/features/controllers/feature.controller.dart';
import 'package:doan/app/modules/navigation/controllers/navigation.controller.dart';
import 'package:get/get.dart';

class FeaturesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FeaturesController>(() => FeaturesController());
    Get.lazyPut<NavigationController>(() => NavigationController());
  }
}
