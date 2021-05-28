import 'package:get/get.dart';

import 'package:doan/app/data/providers/user.provider.dart';
import 'package:doan/app/data/repositories/user.reponsitory.dart';
import 'package:doan/app/modules/user_access/controllers/user_access.controller.dart';

class UserAccessBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<UserAccessController>(
          () => UserAccessController(
        repository: UserRepository(
          apiClient: UserProvider(),
        ),
      ),
    );
  }
}