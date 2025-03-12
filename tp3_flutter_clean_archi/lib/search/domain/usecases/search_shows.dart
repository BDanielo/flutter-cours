import '../entities/search_result.dart';
import '../repositories/search_repository.dart';

class SearchShows {
  final SearchRepository repository;

  SearchShows(this.repository);

  Future<List<SearchResult>> call(String query, int page) {
    return repository.searchShows(query, page);
  }
}
