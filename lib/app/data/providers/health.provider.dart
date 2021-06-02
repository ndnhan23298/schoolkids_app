import 'package:doan/app/data/models/health.model.dart';
import 'package:doan/app/data/models/health_management.model.dart';
import 'package:doan/app/utils/endpoints.dart';
import 'package:doan/app/utils/http_utils.dart';
import 'package:doan/app/utils/keys.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HealthProvider extends GetConnect {
  Future<bool> createHealth(HealthParamModel HealthParam) async {
    try {
      final response = await HttpHelper.post(Endpoint.HEALTH, HealthParam);
      if (response != null) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<List<HealthModel>> getHealthStudent(String studentId) async {
    var studentID = '';
    if(studentId != null) {
      studentID = studentId;
    } else {
      studentID = AppStorageKey.studentId;
    }
    try {
      final response = await HttpHelper.get("${Endpoint.HEALTH}?studentID=${studentID}");
      if (response != null) {
        final result = response.body.map<HealthModel>((_){
          return HealthModel.fromJson(_);
        }).toList();
        return result;
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  Future<List<HealthManagementModel>> getStudentByClass() async {
    final _store = GetStorage();
    try {
      final response = await HttpHelper.get("${Endpoint.STUDENT_BY_CLASS}?classID=${_store.read(AppStorageKey.classId)}");
      if (response != null) {
        final result = response.body.map<HealthManagementModel>((_){
          return HealthManagementModel.fromJson(_);
        }).toList();
        return result;
      }
      return [];
    } catch (e) {
      return [];
    }
  }
}
