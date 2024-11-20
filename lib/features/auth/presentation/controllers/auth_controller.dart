import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/providers/auth_provider.dart';

final authControllerProvider = StateNotifierProvider<AuthController, AsyncValue<String>>((ref) {
  return AuthController(ref);
});

class AuthController extends StateNotifier<AsyncValue<String>> {
  final Ref _ref;

  AuthController(this._ref) : super(const AsyncValue.data(""));

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      // Access AuthService from the provider
      final token = await _ref.read(authProvider).login(email, password);
      state = AsyncValue.data(token);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
