import 'package:doan/app/data/providers/tuition.provider.dart';
import 'package:doan/app/data/repositories/tuition.repository.dart';
import 'package:doan/app/modules/navigation/controllers/navigation.controller.dart';
import 'package:doan/app/modules/tuition/controllers/tuition.controller.dart';
import 'package:get/get.dart';
class TuitionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TuitionController>(
          () => TuitionController(
        repository: TuitionRepository(
          apiClient: TuitionProvider(),
        ),
      ),
    );

    Get.lazyPut<NavigationController>(() => NavigationController());
  }
}
