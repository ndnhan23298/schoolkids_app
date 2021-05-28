import 'package:get/get.dart';

import 'package:doan/app/data/providers/user.provider.dart';
import 'package:doan/app/data/repositories/user.reponsitory.dart';
import 'package:doan/app/modules/auth/controllers/auth.controller.dart';
import 'package:doan/app/modules/auth/controllers/login.controller.dart';
class AuthBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<AuthController>(
      AuthController(
        repository: UserRepository(
          apiClient: UserProvider(),
        ),
      ),
      permanent: true,
    );

    Get.lazyPut<LoginController>(
          () => LoginController(
          repository: UserRepository(
          apiClient: UserProvider(),
        ),
      ),
    );
  }
}