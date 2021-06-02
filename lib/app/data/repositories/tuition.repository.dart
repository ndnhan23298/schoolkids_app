

import 'package:doan/app/data/models/tuition.model.dart';
import 'package:doan/app/data/providers/tuition.provider.dart';
import 'package:meta/meta.dart';

class TuitionRepository {
  final TuitionProvider apiClient;
  TuitionRepository({@required this.apiClient}) : assert(apiClient != null);

  Future<List<TuitionModel>> getFeeClass(String classId) async {
    return apiClient.getFeeClass(classId);
  }

  Future<List<TuitionModel>> getFeeStudent(String studentId) async {
    return apiClient.getFeeStudent(studentId);
  }

  Future<bool> updateTuition (TuitionParamModel tuitionParam, String id) async {
    return apiClient.updateTuition(tuitionParam, id);
  }
}