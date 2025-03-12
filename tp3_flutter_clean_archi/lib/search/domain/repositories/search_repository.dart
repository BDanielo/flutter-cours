import '../entities/search_result.dart';

abstract class SearchRepository {
  Future<List<SearchResult>> searchShows(String query, int page);
}
