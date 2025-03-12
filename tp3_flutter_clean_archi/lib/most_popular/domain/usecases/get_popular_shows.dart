import '../entities/popular_show.dart';
import '../repositories/popular_show_repository.dart';
class GetPopularShows {
  final PopularShowRepository repository;
  GetPopularShows(this.repository);
  Future<List<PopularShow>> call(int page) {
    return repository.getPopularShows(page);
  }
}