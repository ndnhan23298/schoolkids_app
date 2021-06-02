import 'package:doan/app/data/providers/user.provider.dart';
import 'package:doan/app/data/repositories/user.reponsitory.dart';
import 'package:doan/app/modules/auth/controllers/auth.controller.dart';
import 'package:get/get.dart';
import 'package:doan/app/modules/chat/controllers/chat.controller.dart';
import 'package:doan/app/modules/profile/controllers/profile.controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(
      AuthController(
        repository: UserRepository(
          apiClient: UserProvider(),
        ),
      ),
      permanent: true,
    );
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
