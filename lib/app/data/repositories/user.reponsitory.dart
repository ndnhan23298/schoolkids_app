import 'package:doan/app/data/models/user.model.dart';
import 'package:meta/meta.dart';

import 'package:doan/app/data/providers/user.provider.dart';
class UserRepository {
  final UserProvider apiClient;

  UserRepository({@required this.apiClient}) : assert(apiClient != null);
  Future<bool> verifyUser()  async {
    return await apiClient.verifyUser();
  }

  Future<bool> loginUser(String username, String password) async {
    return await apiClient.loginUser(username,password);
  }

  Future<UserAccess> getListUserAccess() async {
    return await apiClient.getListUserAccess();
  }
}
