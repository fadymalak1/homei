import 'package:homei/core/utils/api_provider.dart';
import 'package:homei/core/utils/api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

  Future<String> register(String name, String email, String phone, String password) async {
    final data = {
      "name": name,
      "email": email,
      "phone": phone,
      "password": password,
    };
    final response = await _apiService.post("/register", data);
    return response.data['message']; // Assuming the API returns a success message
  }
}
