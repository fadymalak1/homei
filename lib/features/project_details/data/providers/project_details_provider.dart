// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:homei/core/utils/constants.dart';
// import '../../data/datasources/remote_data_source.dart';
// import '../../domain/entities/project_entity.dart';
// import '../../domain/usecases/get_project_usecase.dart';
// import '../repositories/project_details_repository.dart';
//
// final remoteDataSourceProvider = Provider<RemoteDataSource>((ref) {
//   return RemoteDataSource(baseUrl: Constants.baseUrl); // Replace with your actual base URL
// });
//
// final projectRepositoryProvider = Provider<ProjectDetailsRepository>((ref) {
//   final remoteDataSource = ref.read(remoteDataSourceProvider);
//   return ProjectDetailsRepository(remoteDataSource: remoteDataSource);
// });
//
// final getProjectUseCaseProvider = Provider<GetProjectUseCase>((ref) {
//   final repository = ref.read(projectRepositoryProvider);
//   return GetProjectUseCase(repository: repository);
// });
//
// // Provider for fetching project data
// final projectProvider = FutureProvider<ProjectEntity>((ref) async {
//   final getProjectUseCase = ref.read(getProjectUseCaseProvider);
//   return await getProjectUseCase.call();
// });




import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homei/core/utils/constants.dart';
import 'package:homei/features/project_details/data/repositories/project_details_repository.dart';
import '../../data/datasources/remote_data_source.dart';
import '../../domain/entities/project_entity.dart';
import '../../domain/usecases/get_project_usecase.dart';

// Provider for RemoteDataSource
final remoteDataSourceProvider = Provider<RemoteDataSource>((ref) {
  return RemoteDataSource(baseUrl: Constants.baseUrl); // Mocked or actual base URL
});

// Provider for ProjectDetailsRepository
final projectRepositoryProvider = Provider<ProjectDetailsRepository>((ref) {
  final remoteDataSource = ref.read(remoteDataSourceProvider);
  return ProjectDetailsRepository();
});

// Provider for GetProjectUseCase
final getProjectUseCaseProvider = Provider<GetProjectUseCase>((ref) {
  final repository = ref.read(projectRepositoryProvider);
  return GetProjectUseCase(repository: repository);
});

// FutureProvider for fetching project data
final projectProvider = FutureProvider<ProjectEntity>((ref) async {
  final getProjectUseCase = ref.read(getProjectUseCaseProvider);

  try {
    final project = await getProjectUseCase.call();
    return project;
  } catch (error, stackTrace) {
    // Add error handling or logging here if needed
    throw AsyncValue.error(error, stackTrace);
  }
});
