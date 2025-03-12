import '../../domain/entities/show_details.dart';
import '../../domain/repositories/show_details_repository.dart';
import '../datasources/show_details_remote_data_source.dart';

class ShowDetailsRepositoryImpl implements ShowDetailsRepository {
  final ShowDetailsRemoteDataSource remoteDataSource;

  ShowDetailsRepositoryImpl(this.remoteDataSource);

  @override
  Future<ShowDetails> getShowDetails(int id) async {
    final model = await remoteDataSource.fetchShowDetails(id);
    return ShowDetails(
      id: model.id,
      name: model.name,
      imageUrl: model.imageUrl,
      description: model.description,
      genres: model.genres,
      status: model.status,
    );
  }
}