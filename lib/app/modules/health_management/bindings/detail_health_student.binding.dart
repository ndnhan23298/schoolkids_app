import 'package:get/get.dart';
import 'package:doan/app/modules/health_management/controllers/detail_health_student.controller.dart';

class DetailHeathStudentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailHealthStudentController>(() => DetailHealthStudentController());
  }
}
