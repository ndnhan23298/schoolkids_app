import 'package:doan/app/data/models/leave_day.model.dart';
import 'package:doan/app/data/providers/leave_day.provider.dart';
import 'package:meta/meta.dart';

class LeaveDayRepository {
  final LeaveDayProvider apiClient;
  LeaveDayRepository({@required this.apiClient}) : assert(apiClient != null);

  Future<bool> createLeaveDay (LeaveDayParamModel leaveDayParam) async {
    return apiClient.createLeaveDay(leaveDayParam);
  }

  Future<List<LeaveDayModel>> getLeaveDay( String classID) async {
    return apiClient.getLeaveDay(classID);
  }

}