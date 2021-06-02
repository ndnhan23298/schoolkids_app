import 'package:doan/app/data/providers/health.provider.dart';
import 'package:doan/app/data/repositories/health.repository.dart';
import 'package:get/get.dart';
import 'package:doan/app/modules/health_management/controllers/health_management.controller.dart';

class HeathManagementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HealthManagementController>( () => HealthManagementController(
      repository: HealthRepository(
        apiClient: HealthProvider(),
      ),
    ),);
  }
}
