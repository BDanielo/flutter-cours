import '../../domain/entities/search_result.dart';
import '../../domain/repositories/search_repository.dart';
import '../models/datasources/search_remote_data_source.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchRemoteDataSource remoteDataSource;

  SearchRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<SearchResult>> searchShows(String query, int page) async {
    final models = await remoteDataSource.searchShows(query, page);
    return models.map((model) => SearchResult(id: model.id, name: model.name, imageUrl: model.imageUrl)).toList();
  }
}
