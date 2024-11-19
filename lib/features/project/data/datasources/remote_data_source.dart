import 'package:dio/dio.dart';
import '../models/project_details_model.dart';

class RemoteDataSource {
  final String baseUrl;
  final Dio dio;

  RemoteDataSource({required this.baseUrl, Dio? dio}) : dio = dio ?? Dio();

  Future<ProjectDetailsModel> fetchProject() async {
    try {
      final response = await dio.get('$baseUrl/project');
      if (response.statusCode == 200) {
        return ProjectDetailsModel.fromJson(response.data);
      } else {
        throw Exception('Failed to fetch project data');
      }
    } catch (error) {
      throw Exception('Error occurred while fetching project data: $error');
    }
  }
}
