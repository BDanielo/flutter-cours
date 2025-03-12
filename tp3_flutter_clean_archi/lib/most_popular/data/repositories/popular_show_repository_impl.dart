import '../../domain/entities/popular_show.dart';
import '../../domain/repositories/popular_show_repository.dart';
import '../datasources/popular_show_remote_data_source.dart';
class PopularShowRepositoryImpl implements PopularShowRepository {
  final PopularShowRemoteDataSource remoteDataSource;
  PopularShowRepositoryImpl(this.remoteDataSource);
  @override
  Future<List<PopularShow>> getPopularShows(int page) async {
    final models = await remoteDataSource.fetchPopularShows(page);
    return models.map((model) => PopularShow(id: model.id, name: model.name, imageUrl:
    model.imageUrl)).toList();
  }
}