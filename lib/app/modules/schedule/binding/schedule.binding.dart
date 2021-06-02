import 'package:doan/app/data/providers/leave_day.provider.dart';
import 'package:doan/app/data/repositories/leave_day.repository.dart';
import 'package:doan/app/modules/schedule/controller/schedule.controller.dart';
import 'package:get/get.dart';

class ScheduleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScheduleController>(
      () => ScheduleController(
        repository: LeaveDayRepository(
          apiClient: LeaveDayProvider(),
        ),
      ),
    );
  }
}
