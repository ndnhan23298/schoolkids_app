import 'package:doan/app/data/models/activity.model.dart';
import 'package:doan/app/data/repositories/activity.repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ActivityController extends GetxController {

  final ActivityRepository repository;
  ActivityController({@required this.repository}) : assert (repository != null);

  Rx<TextEditingController> nameActivity = TextEditingController().obs;
  Rx<TextEditingController> content = TextEditingController().obs;



  @override
  void onInit() async {
    _getActivities();
    super.onInit();
  }

  Future<void> _getActivities() async{
    await repository.getActivities().then((response){
      print(response);
    });
  }

  Future<void> onSave() async {
    ActivityParamModel activityParam = ActivityParamModel(
      name: nameActivity.value.text,
      address: content.value.text
    );
    try{
      await repository.createActivities(activityParam).then((response){
        if(response != null && response == true){
          Get.dialog(
            Container(
              width: Get.width * 0.9,
              height: 200,
              color: Colors.red,
            )
          );
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
