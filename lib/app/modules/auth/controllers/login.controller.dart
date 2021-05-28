import 'package:doan/app/utils/keys.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:doan/app/routes/app_pages.dart';
import 'package:doan/app/data/repositories/user.reponsitory.dart';
import 'package:doan/app/modules/auth/controllers/auth.controller.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final _store = GetStorage();
  final AuthController _authController = AuthController.to;
  final UserRepository repository;
  LoginController({@required this.repository}) : assert (repository != null);
  static LoginController get to => Get.find<LoginController>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> loginUser() async {
    try {
      if(await repository.loginUser(
        emailController.text,
        passwordController.text,
      )){
        final String  accessToken = await _store.read(AppStorageKey.ACCESS_TOKEN);
        await _authController.setLoggedUser(accessToken);
      } else{
        Get.showSnackbar(
            GetBar(
              snackStyle: SnackStyle.FLOATING,
              messageText: Container(
                alignment: Alignment.center,
                child: Text("Incorrect email/password. Please try again.", style: TextStyle(
                  color: Colors.white
                ),)
              ),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 2),
            )
        );
      }
    } catch (e) {
    }
  }

  Future<void> verifyUser() async {
    try{
      bool verifyUser = await repository.verifyUser();
      print(verifyUser);
      if(verifyUser) {
        Get.toNamed(Routes.HOME);
      } else{
        Get.showSnackbar(
            GetBar(
              snackStyle: SnackStyle.FLOATING,
              messageText: Container(
                alignment: Alignment.center,
                child: Text("Incorrect email/password. Please try again.", style: TextStyle(
                    color: Colors.white
                ),),
              ),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 2),
            )
        );
      }
      loginUser();
    }catch(e){
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
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
}
