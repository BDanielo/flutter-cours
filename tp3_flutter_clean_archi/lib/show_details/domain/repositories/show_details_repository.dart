import '../entities/show_details.dart';

abstract class ShowDetailsRepository {
  Future<ShowDetails> getShowDetails(int id);
}