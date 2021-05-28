

import 'package:doan/app/data/models/activity.model.dart';
import 'package:doan/app/data/providers/activity.provider.dart';
import 'package:meta/meta.dart';

class ActivityRepository {
  final ActivityProvider apiClient;
  ActivityRepository({@required this.apiClient}) : assert(apiClient != null);

  Future<List<ActivityModel>> getActivities() async {
   return apiClient.getActivities();
  }

  Future<bool> createActivities (ActivityParamModel activityParam) async {
    return apiClient.createActivities(activityParam);
  }
}