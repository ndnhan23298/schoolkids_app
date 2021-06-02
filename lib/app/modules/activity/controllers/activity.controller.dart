import 'package:doan/app/data/models/activity.model.dart';
import 'package:doan/app/data/repositories/activity.repository.dart';
import 'package:doan/app/utils/keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
class ActivityController extends GetxController {

  final ActivityRepository repository;
  final _store = GetStorage();
  ActivityController({@required this.repository}) : assert (repository != null);

  Rx<TextEditingController> nameActivity = TextEditingController().obs;
  Rx<TextEditingController> content = TextEditingController().obs;
  RxList<ActivityModel> activitiess =  RxList<ActivityModel>([]);
  RxList<ActivityModel> joinedActivitiess =  RxList<ActivityModel>([]);
  RxBool isLoadding = false.obs;



  @override
  void onInit() async {
    // _getActivities();
    _getJoinedActivities();
    super.onInit();
  }

  Future<void> _getActivities() async{
    isLoadding.value = true;
    update();
    try {
      await repository.getActivities().then((response){
        isLoadding.value = false;
        update();
        if(response != null){
          activitiess.addAll(response);
        }
      });
    }catch (e) {

    }
  }

  Future<void> _getJoinedActivities() async{
    isLoadding.value = true;
    update();
    try {
      String studentID = _store.read(AppStorageKey.studentId);
      await repository.getJoinedActivities(studentID).then((response){
        isLoadding.value = false;
        update();
        if(response != null){
          activitiess.addAll(response['listActitities']);
          joinedActivitiess.addAll(response['listJoinedActitities']);
        }
      });
    }catch (e) {

    }
  }

  Future<void> onSave() async {
    ActivityParamModel activityParam = ActivityParamModel(
      name: nameActivity.value.text,
      address: content.value.text
    );
    try{
      isLoadding.value = true;
      update();
      await repository.createActivities(activityParam).then((response){
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

  Future<void> onJoin(String activityID) async {
    ParticipantParamModel participantParam = ParticipantParamModel(
        studentID: _store.read(AppStorageKey.studentId),
        classID: _store.read(AppStorageKey.classId),
        activityID: activityID,
    );
    try{
      isLoadding.value = true;
      update();
      await repository.createParticipants(participantParam).then((response){
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
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() async {
    super.onClose();
  }
}
