import 'package:doan/app/data/models/health.model.dart';
import 'package:doan/app/data/models/health_management.model.dart';
import 'package:doan/app/data/providers/health.provider.dart';
import 'package:meta/meta.dart';

class HealthRepository {
  final HealthProvider apiClient;
  HealthRepository({@required this.apiClient}) : assert(apiClient != null);

  Future<List<HealthModel>> getHealthStudent(String studentId) async {
    return apiClient.getHealthStudent(studentId);
  }

  Future<List<HealthManagementModel>> getStudentByClass() async {
    return apiClient.getStudentByClass();
  }

  Future<bool> createHealth (HealthParamModel healthParam) async {
    return apiClient.createHealth(healthParam);
  }
}