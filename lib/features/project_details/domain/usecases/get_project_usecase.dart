import '../../data/repositories/project_details_repository.dart';
import '../entities/project_entity.dart';

class GetProjectUseCase {
  final ProjectDetailsRepository repository;

  GetProjectUseCase({required this.repository});

  Future<ProjectEntity> call() {
    return repository.getProject();
  }
}
