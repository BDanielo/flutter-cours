import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/popular_show.dart';
import '../../domain/usecases/get_popular_shows.dart';
class PopularShowBloc extends Cubit<List<PopularShow>> {
  final GetPopularShows getPopularShows;
  PopularShowBloc(this.getPopularShows) : super([]);
  void loadShows(int page) async {
    final shows = await getPopularShows(page);
    emit(shows);
  }
}