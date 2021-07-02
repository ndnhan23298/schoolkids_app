import 'package:doan/app/data/models/user.model.dart';
import 'package:doan/app/modules/navigation/controllers/navigation.controller.dart';
import 'package:doan/app/routes/app_pages.dart';
import 'package:doan/app/utils/keys.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:doan/app/data/repositories/user.reponsitory.dart';
import 'package:get_storage/get_storage.dart';

class UserAccessController extends GetxController {
  final _store = GetStorage();
  final UserRepository repository;

  UserAccessController({@required this.repository})
      : assert(repository != null);

  static UserAccessController get to => Get.find<UserAccessController>();

  Rx<UserAccess> userAccess = Rx<UserAccess>();
  RxList<DataAccessModel> data = RxList<DataAccessModel>([]);
  RxBool isLoading = false.obs;

  RxString userDisplay = RxString("");

  @override
  void onInit() async {
    // TODO: implement onInit
    _getUserAccess();
    await _store.remove(AppStorageKey.classId);
    await _store.remove(AppStorageKey.studentId);
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
        update();
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
        // id: _.id,
        name: _.name,
        classId: _.id,
      );
      data.add(dataAccess);
    });
    userAccess.students.forEach((_) {
      DataAccessModel dataAccess = new DataAccessModel(
          id: _.id, name: _.firstName + ' ' + _.lastName, classId: _.classID);
      data.add(dataAccess);
    });
    userAccess.schools.forEach((_) {
      DataAccessModel dataAccess = new DataAccessModel(
          name: _.name,
          schoolId: _.id);
      data.add(dataAccess);
    });
  }

  void onSelected(DataAccessModel dataAccess) {
    if (dataAccess.id != null) {
      _store.write(AppStorageKey.studentId, dataAccess.id);
    }
    if  (dataAccess.classId != null) {
      _store.write(AppStorageKey.classId, dataAccess.classId);
    }
    if  (dataAccess.schoolId != null) {
      _store.write(AppStorageKey.schoolId, dataAccess.schoolId);
    }
    userDisplay.value = dataAccess.name;
    update();
    NavigationController.currentIndex.value = 0;
    Get.toNamed(Routes.HOME);
  }
}
