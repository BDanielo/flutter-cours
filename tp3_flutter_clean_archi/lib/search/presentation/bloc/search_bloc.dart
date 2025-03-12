import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/search_result.dart';
import '../../domain/usecases/search_shows.dart';

class SearchBloc extends Cubit<List<SearchResult>> {
  final SearchShows searchShows;

  SearchBloc(this.searchShows) : super([]);

  void search(String query, {int page = 1}) async {
    final results = await searchShows(query, page);
    emit(results);
  }
}
