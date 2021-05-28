
import 'package:doan/app/data/providers/home.provider.dart';
import 'package:doan/app/data/repositories/home.repository.dart';
import 'package:doan/app/modules/home/controllers/home.controller.dart';
import 'package:doan/app/modules/navigation/controllers/navigation.controller.dart';
import 'package:doan/app/modules/profile/controllers/profile.controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings{
  void dependencies() {

    Get.lazyPut<HomeController>(
          () => HomeController(
        repository: HomeRepository(
          apiClient: HomeProvider(),
        ),
      ),
    );

    Get.lazyPut<NavigationController>(() => (NavigationController()));
  }
}