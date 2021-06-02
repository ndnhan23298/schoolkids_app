import 'package:doan/app/data/models/tuition.model.dart';
import 'package:doan/app/utils/endpoints.dart';
import 'package:doan/app/utils/http_utils.dart';
import 'package:get/get.dart';

class TuitionProvider extends GetConnect {
  Future<bool> updateTuition(TuitionParamModel tuitionParam, String id) async {
    try {
      final response = await HttpHelper.put("${Endpoint.FEE_CLASS}/$id", tuitionParam);
      if (response != null) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<List<TuitionModel>> getFeeClass(String classId) async {
    try {
      final response = await HttpHelper.get("${Endpoint.FEE_CLASS}?classID=$classId");
      if (response != null) {
        final result = response.body.map <TuitionModel> ((_){
          return TuitionModel.fromJson(_);
        }).toList();
        return result;
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  Future<List<TuitionModel>> getFeeStudent(String studentId) async {
    try {
      final response = await HttpHelper.get("${Endpoint.FEE_STUDENT}/$studentId");
      if (response != null) {
        final result = response.body.map<TuitionModel>((_) {
         return TuitionModel.fromJson(_);
        }).toList();
        return result;
      }
      return [];
    } catch (e) {
      return [];
    }
  }

}