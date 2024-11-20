import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:homei/core/utils/api_provider.dart';
import 'package:homei/core/utils/api_service.dart';

final authProvider = Provider<AuthService>((ref) {
  final apiService = ref.read(apiServiceProvider);
  return AuthService(apiService);
});

class AuthService {
  final ApiService _apiService;

  AuthService(this._apiService);

  Future<String> login(String email, String password) async {
    final data = {"email": email, "password": password};
    final response = await _apiService.post("/login", data);
    return response.data['token']; // Assuming the API returns a token
  }
}
