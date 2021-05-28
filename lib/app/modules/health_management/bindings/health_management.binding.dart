import 'package:get/get.dart';
import 'package:doan/app/modules/health_management/controllers/health_management.controller.dart';

class HeathManagementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HealthManagementController>(() => HealthManagementController());
  }
}
