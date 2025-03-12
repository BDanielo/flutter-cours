import '../entities/show_details.dart';
import '../repositories/show_details_repository.dart';

class GetShowDetails {
  final ShowDetailsRepository repository;

  GetShowDetails(this.repository);

  Future<ShowDetails> call(int id) {
    return repository.getShowDetails(id);
  }
}