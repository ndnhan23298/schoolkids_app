

import 'package:doan/app/data/models/activity.model.dart';
import 'package:doan/app/data/models/participant2.model.dart';
import 'package:doan/app/data/providers/activity.provider.dart';
import 'package:meta/meta.dart';

class ActivityRepository {
  final ActivityProvider apiClient;
  ActivityRepository({@required this.apiClient}) : assert(apiClient != null);

  Future<List<ActivityModel>> getActivities() async {
   return apiClient.getActivities();
  }

  Future<List<ParticipantModel>> getParticipants(String activityID, String classID) async {
    return apiClient.getParticipants(activityID, classID);
  }

  Future<dynamic> getJoinedActivities(String studentID) async {
    return apiClient.getJoinedActivities(studentID);
  }

  Future<bool> createActivities (ActivityParamModel activityParam) async {
    return apiClient.createActivities(activityParam);
  }

  Future<bool> createParticipants (ParticipantParamModel participantParam) async {
    return apiClient.createParticipant(participantParam);
  }
}