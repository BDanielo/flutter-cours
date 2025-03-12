import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp3_flutter_clean_archi/search/data/models/datasources/search_remote_data_source.dart';
import 'most_popular/data/datasources/popular_show_remote_data_source.dart';
import 'most_popular/data/repositories/popular_show_repository_impl.dart';
import 'most_popular/domain/usecases/get_popular_shows.dart';
import 'most_popular/presentation/bloc/popular_show_bloc.dart';
import 'most_popular/presentation/pages/popular_shows_page.dart';

import 'show_details/data/datasources/show_details_remote_data_source.dart';
import 'show_details/data/repositories/show_details_repository_impl.dart';
import 'show_details/domain/usecases/get_show_details.dart';
import 'show_details/presentation/bloc/show_details_bloc.dart';
import 'show_details/presentation/pages/show_details_page.dart';

import 'search/data/repositories/search_repository_impl.dart';
import 'search/domain/usecases/search_shows.dart';
import 'search/presentation/bloc/search_bloc.dart';
import 'search/presentation/pages/search_page.dart';

void main() {
  // Création des data sources
  final popularShowRemoteDataSource = PopularShowRemoteDataSource();
  final showDetailsRemoteDataSource = ShowDetailsRemoteDataSource();
  final searchRemoteDataSource = SearchRemoteDataSource();

  // Création des repositories
  final popularShowRepository = PopularShowRepositoryImpl(popularShowRemoteDataSource);
  final showDetailsRepository = ShowDetailsRepositoryImpl(showDetailsRemoteDataSource);
  final searchRepository = SearchRepositoryImpl(searchRemoteDataSource);

  // Création des use cases
  final getPopularShows = GetPopularShows(popularShowRepository);
  final getShowDetails = GetShowDetails(showDetailsRepository);
  final searchShows = SearchShows(searchRepository);

  runApp(MyApp(
    getPopularShows: getPopularShows,
    getShowDetails: getShowDetails,
    searchShows: searchShows,
  ));
}

class MyApp extends StatelessWidget {
  final GetPopularShows getPopularShows;
  final GetShowDetails getShowDetails;
  final SearchShows searchShows;

  MyApp({
    required this.getPopularShows,
    required this.getShowDetails,
    required this.searchShows,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PopularShowBloc(getPopularShows)),
        BlocProvider(create: (context) => ShowDetailsBloc(getShowDetails)),
        BlocProvider(create: (context) => SearchBloc(searchShows)),
      ],
      child: MaterialApp(
        title: 'TV Show App',
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: '/',
        routes: {
          '/': (context) => PopularShowsPage(),
          '/details': (context) {
            final int showId = ModalRoute.of(context)!.settings.arguments as int;
            return ShowDetailsPage(showId: showId);
          },
          '/search': (context) => SearchPage(),
        },
      ),
    );
  }
}
