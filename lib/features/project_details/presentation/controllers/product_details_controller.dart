// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:homei/features/project/data/providers/project_details_provider.dart';
// import '../../data/models/project_details_model.dart';
// import '../../data/repositories/project_details_repository.dart';
// import '../../domain/entities/project_entity.dart';
//
// class ProjectDetailsController extends StateNotifier<AsyncValue<ProjectEntity>> {
//   final ProjectDetailsRepository repository;
//
//   ProjectDetailsController(this.repository) : super(const AsyncValue.loading()) {
//     fetchProjectDetails();
//   }
//
//   Future<void> fetchProjectDetails() async {
//     try {
//       final project = await repository.getProject();
//       state = AsyncValue.data(project);
//     } catch (error, stackTrace) {
//       state = AsyncValue.error(error, stackTrace);
//     }
//   }
// }
//
// // Controller Provider
// final projectDetailsControllerProvider =
// StateNotifierProvider<ProjectDetailsController, AsyncValue<ProjectEntity>>((ref) {
//   final repository = ref.read(projectRepositoryProvider);
//   return ProjectDetailsController(repository);
// });


// for dummy data

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homei/features/project_details/data/providers/project_details_provider.dart';
import '../../data/repositories/project_details_repository.dart';
import '../../domain/entities/project_entity.dart';

class ProjectDetailsController extends StateNotifier<AsyncValue<ProjectEntity>> {
  final ProjectDetailsRepository repository;

  ProjectDetailsController(this.repository) : super(const AsyncValue.loading()) {
    fetchProjectDetails();
  }

  Future<void> fetchProjectDetails() async {
    try {
      final project = await repository.getProject();
      state = AsyncValue.data(project);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

// Provide the controller with the repository
final projectDetailsControllerProvider =
StateNotifierProvider<ProjectDetailsController, AsyncValue<ProjectEntity>>((ref) {
  final repository = ProjectDetailsRepository();
  // final repository = ref.read(projectRepositoryProvider);
  return ProjectDetailsController(repository);
});
