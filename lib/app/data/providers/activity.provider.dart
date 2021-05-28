import 'package:doan/app/data/models/activity.model.dart';
import 'package:doan/app/utils/endpoints.dart';
import 'package:doan/app/utils/http_utils.dart';
import 'package:get/get.dart';

class ActivityProvider extends GetConnect {
  Future<bool> createActivities(ActivityParamModel activityParam) async {
    try {
      final response = await HttpHelper.post(Endpoint.ACTIVITY, activityParam);
      if (response != null) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<List<ActivityModel>> getActivities() async {
    try {
      final response = await HttpHelper.get(Endpoint.ACTIVITY);
      if (response != null) {
        final result = response.body.map((_){
          ActivityModel.fromJson(_);
        }).toList();
        return result;
      }
      return [];
    } catch (e) {
      return [];
    }
  }
}
