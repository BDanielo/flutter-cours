import '../entities/popular_show.dart';
abstract class PopularShowRepository {
  Future<List<PopularShow>> getPopularShows(int page);
}