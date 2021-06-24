import 'package:doan/app/data/models/leave_day.model.dart';
import 'package:doan/app/data/repositories/leave_day.repository.dart';
import 'package:doan/app/utils/keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
class ScheduleController extends GetxController {
  final LeaveDayRepository repository;
  ScheduleController({@required this.repository}) : assert (repository != null);
  final _store = GetStorage();

  RxBool isLoadding = false.obs;
  RxInt currentIndex = RxInt(0);

  void selectedIndex(int index){
    currentIndex.value = index;
    update();
  }

  Future<void> onSave(data) async {
    LeaveDayParamModel leaveDayParam = LeaveDayParamModel(
      firstDay: data["firstDay"],
      lastDay: data["lastDay"],
      content: data["content"],
      studentID: _store.read(AppStorageKey.studentId),
    );
    try{
      isLoadding.value = true;
      update();
      await repository.createLeaveDay(leaveDayParam).then((response){
        isLoadding.value = false;
        update();
        if(response != null && response == true){
          Get.back();
        }
      });
    }catch(e){
      print(e);
    }
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
