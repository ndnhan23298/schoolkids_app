import 'package:doan/app/data/models/tuition.model.dart';
import 'package:doan/app/data/repositories/tuition.repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:doan/app/utils/keys.dart';

class TuitionController extends GetxController {
  final store = GetStorage();
  final TuitionRepository repository;
  TuitionController({@required this.repository}) : assert (repository != null);
  RxBool isLoadData = RxBool(false);
  RxList<TuitionModel> studentTuition = RxList<TuitionModel>([]);
  RxList<TuitionModel> classTuition = RxList<TuitionModel>([]);

  RxString statusFee = RxString("");

  @override
  void onInit() async {
    _getFeeStudent();
     _getFeeClass();
    super.onInit();
  }

  Future<void> _getFeeStudent() async{
    isLoadData.value = true;
    update();
    try{
      isLoadData.value = false;
      update();
      await repository.getFeeStudent(store.read(AppStorageKey.studentId)).then((response){
        if(response != null){
          studentTuition.addAll(response);
        }
      });
    }catch(e){

    }
  }

  Future<void> _getFeeClass() async{
    isLoadData.value = true;
    update();
    try{
      isLoadData.value = false;
      update();
      await repository.getFeeClass(store.read(AppStorageKey.classId)).then((response){
        if(response != null){
          classTuition.addAll(response);
          update();
        }
      });
    }catch(e){

    }
  }

  Future<void> onSave(int index) async {
    statusFee.value = classTuition[index].status;
    if( statusFee.value == "Not Yet"){
      statusFee.value = "Done";
    }else{
      statusFee.value = "Not Yet";
    }
    classTuition.value[index].status = statusFee.value;
    update();
    TuitionParamModel tuitionParam = TuitionParamModel(
        status: statusFee.value,
    );
    try{
      isLoadData.value = true;
      update();
      await repository.updateTuition(tuitionParam, classTuition.value[index].id).then((response){
        isLoadData.value = false;
        update();
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
