import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:homei/core/utils/constants.dart';
import 'api_service.dart';

final dioProvider = Provider<Dio>((ref) => Dio(BaseOptions(baseUrl: Constants.baseUrl)));

final apiServiceProvider = Provider<ApiService>((ref) {
  final dio = ref.read(dioProvider);
  return ApiService(dio);
});
