import 'package:doan/app/data/models/health.model.dart';
import 'package:doan/app/data/models/health_management.model.dart';
import 'package:doan/app/data/repositories/health.repository.dart';
import 'package:doan/app/utils/keys.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

class HealthManagementController extends GetxController {
  final _store = GetStorage();
  final HealthRepository repository;
  HealthManagementController({@required this.repository}) : assert (repository != null);

  Rx<TextEditingController> height = TextEditingController().obs;
  Rx<TextEditingController> weight = TextEditingController().obs;
  Rx<TextEditingController> note = TextEditingController().obs;
  RxList<HealthModel> studentHealth =  RxList<HealthModel>([]);
  RxList<HealthManagementModel> studentByClass =  RxList<HealthManagementModel>([]);
  RxBool isLoadding = false.obs;
  String studentID = null;

  @override
  void onInit() async {
    _getStudentByClass();
    if(_store.read(AppStorageKey.studentId) != null){
      getHealthStudent(_store.read(AppStorageKey.studentId));
    }
    super.onInit();
  }

  Future<void> _getStudentByClass() async{
    isLoadding.value = true;
    update();
    try {
      await repository.getStudentByClass().then((response){
        isLoadding.value = false;
        update();
        if(response != null){
          studentByClass.addAll(response);
        }
      });
    }catch (e) {

    }
  }

  Future<void> getHealthStudent(String studentId) async{
    studentID = studentId;
    isLoadding.value = true;
    update();
    try {
      await repository.getHealthStudent(studentId).then((response){
        isLoadding.value = false;
        update();
        if(response != null){
          studentHealth.clear();
          studentHealth.addAll(response);
        }
      });
    }catch (e) {

    }
  }

  Future<void> onSave() async {
    HealthParamModel healthParam = HealthParamModel(
        height: height.value.text,
        weight: weight.value.text,
        note: note.value.text,
        studentID: studentID,
    );
    try{
      isLoadding.value = true;
      update();
      await repository.createHealth(healthParam).then((response){
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
