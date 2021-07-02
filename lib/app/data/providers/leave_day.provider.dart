import 'package:doan/app/data/models/leave_day.model.dart';
import 'package:doan/app/utils/endpoints.dart';
import 'package:doan/app/utils/http_utils.dart';
import 'package:doan/app/utils/keys.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LeaveDayProvider extends GetConnect {
  Future<bool> createLeaveDay(LeaveDayParamModel leaveDayParam) async {
    try {
      final response = await HttpHelper.post(Endpoint.LEAVE_DAY, leaveDayParam);
      if (response != null) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<List<LeaveDayModel>> getLeaveDay(String classID) async {
    try {
      final response = await HttpHelper.get("${Endpoint.LEAVE_DAY}?classID=${classID}");
      if (response != null) {
        final listLeaveDay = response.body.map<LeaveDayModel>((_){
          return LeaveDayModel.fromJson(_);
        }).toList();
        return listLeaveDay;
      }
      return [];
    } catch (e) {
      return [];
    }
  }
}
