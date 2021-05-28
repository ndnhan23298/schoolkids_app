import 'package:doan/app/data/models/user.model.dart';
import 'package:doan/app/utils/endpoints.dart';
import 'package:doan/app/utils/http_utils.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:doan/app/utils/keys.dart';

class UserProvider extends GetConnect {
  final _store = GetStorage();

  Future<bool> verifyUser() async {
    try{
      final storedToken = await _store.read(AppStorageKey.ACCESS_TOKEN);
      if (storedToken.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    }catch(e){
      return false;
    }
  }

  Future<bool> loginUser(String username, String password) async {
    final data = {
      "username": username,
      "password": password
    };
    try{
     final result =  await HttpHelper.post(Endpoint.LOGIN, data);
     UserLoginModel userLoginModel = UserLoginModel.fromJson(result.body);
     if(userLoginModel != null){
       final validUsers = userLoginModel.accessToken;
       if(validUsers.isNotEmpty){
         await _store.write(AppStorageKey.ACCESS_TOKEN, validUsers);
         return true;
       }
       return false;
     }
    }catch(e){
      throw e;
    }
  }

  Future<UserAccess> getListUserAccess() async {
    try{
      final result =  await HttpHelper.get(Endpoint.ME);
      if(result != null){
        return UserAccess.fromJson(result.body);
      }else{
        return null;
      }
    }catch(e){
      return null;
    }
  }
}
