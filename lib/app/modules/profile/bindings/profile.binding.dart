import 'package:get/get.dart';
import 'package:doan/app/modules/chat/controllers/chat.controller.dart';
import 'package:doan/app/modules/profile/controllers/profile.controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
