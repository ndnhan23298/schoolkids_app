import 'package:doan/app/data/providers/activity.provider.dart';
import 'package:doan/app/data/repositories/activity.repository.dart';
import 'package:doan/app/modules/activity/controllers/activity.controller.dart';
import 'package:doan/app/modules/navigation/controllers/navigation.controller.dart';
import 'package:get/get.dart';
class ActivityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ActivityController>(
          () => ActivityController(
        repository: ActivityRepository(
          apiClient: ActivityProvider(),
        ),
      ),
    );

    Get.lazyPut<ActivityController>(
          () => ActivityController(
        repository: ActivityRepository(
          apiClient: ActivityProvider(),
        ),
      ),
    );

    Get.lazyPut<NavigationController>(() => NavigationController());
  }
}
