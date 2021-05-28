import 'package:doan/app/data/models/user.model.dart';
import 'package:doan/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:doan/app/data/repositories/user.reponsitory.dart';

class UserAccessController extends GetxController {
  final UserRepository repository;

  UserAccessController({@required this.repository})
      : assert(repository != null);

  static UserAccessController get to => Get.find<UserAccessController>();

  Rx<UserAccess> userAccess = Rx<UserAccess>();
  RxList<DataAccessModel> data = RxList<DataAccessModel>([]);
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    _getUserAccess();
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  Future<void> _getUserAccess() async {
    try {
      isLoading.value = true;
      update();
      await repository.getListUserAccess().then((response) {
        isLoading.value = false;
        if (response != null) {
          userAccess.value = response;
          if (userAccess.value != null) getListName(userAccess.value);
        } else {
          // TODO: handle
        }
        update();
      });
    } catch (e) {
      isLoading.value = false;
      update();
    }
  }

  void getListName(UserAccess userAccess) {
    userAccess.classes.forEach((_) {
      DataAccessModel dataAccess = new DataAccessModel(
        id: _.id,
        name: _.name,
        classId: _.id,
      );
      data.add(dataAccess);
    });
    userAccess.students.forEach((_) {
      DataAccessModel dataAccess = new DataAccessModel(
          id: _.id, name: _.firstName + _.lastName, classId: _.classID);
      data.add(dataAccess);
    });
  }

  void onSelected(DataAccessModel dataAccess){
    Get.toNamed(Routes.HOME, arguments: dataAccess.classId);
  }
}
