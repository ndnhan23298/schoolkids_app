import 'package:doan/app/data/models/activity.model.dart';
import 'package:doan/app/data/models/participant2.model.dart';
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

  Future<bool> createParticipant(ParticipantParamModel participantParam) async {
    try {
      final response = await HttpHelper.post(Endpoint.PARTICIPANT, participantParam);
      if (response != null) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<List<ParticipantModel>> getParticipants(String activityID, String classID) async {
    try {
      final response = await HttpHelper.get("${Endpoint.PARTICIPANT}?activityID=${activityID}&classID=${classID}");
      if (response != null) {
        final listParticipants = response.body.map<ParticipantModel>((_){
          return ParticipantModel.fromJson(_);
        }).toList();
        return listParticipants;
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  Future<List<ActivityModel>> getActivities() async {
    try {
      final response = await HttpHelper.get(Endpoint.ACTIVITY);
      if (response != null) {
        final listActitities = response.body.map<ActivityModel>((_){
          return ActivityModel.fromJson(_);
        }).toList();
        return listActitities;
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  Future<dynamic> getJoinedActivities(String studentID) async {
    try {
      final response = await HttpHelper.get("${Endpoint.ACTIVITY}?studentID=${studentID}");
      if (response != null) {
        final listActitities = response.body['activities'].map<ActivityModel>((_){
          return ActivityModel.fromJson(_);
        }).toList();

        final listJoinedActitities = response.body['joinedActivities'].map<ActivityModel>((_){
          return ActivityModel.fromJson(_);
        }).toList();

        return {
          'listActitities': listActitities,
          'listJoinedActitities': listJoinedActitities
        };
      }
      return [];
    } catch (e) {
      return [];
    }
  }

}
