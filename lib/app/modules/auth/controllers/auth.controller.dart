import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

import 'package:doan/app/utils/keys.dart';
import 'package:doan/app/routes/app_pages.dart';
import 'package:doan/app/data/repositories/user.reponsitory.dart';

class AuthController extends GetxController {
  final UserRepository repository;
  AuthController({@required this.repository}) : assert(repository != null);
  static AuthController get to => Get.find<AuthController>();
  final _store = GetStorage();
  RxBool isLoggedIn = RxBool(false);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    //Run every time auth state changes
    ever(isLoggedIn, handleAuthChanged);
    await verifyUser();
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> verifyUser() async {
    final storedToken = await _store.read(AppStorageKey.ACCESS_TOKEN);
    if (storedToken != null) {
      try {
        isLoggedIn.value = true;
      } catch (e) {
        isLoggedIn.value = false;
      }
    } else {
      isLoggedIn.value = false;
    }
  }

  Future<void> setLoggedUser(String token) async {
    isLoggedIn.value = true;
    await _store.write(AppStorageKey.ACCESS_TOKEN, token);
  }
  handleAuthChanged(isLoggedIn) async {
    if (isLoggedIn) {
      Get.toNamed(Routes.USER_ACCESS);
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
  }

  Future<void> logout() async {
    isLoggedIn.value = false;
    //
    await _store.remove(AppStorageKey.ACCESS_TOKEN);
    //
    Get.offAllNamed(Routes.LOGIN);
  }

}
