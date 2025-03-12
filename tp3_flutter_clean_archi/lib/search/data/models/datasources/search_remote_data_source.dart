import 'dart:convert';
import 'package:http/http.dart' as http;

import '../search_result_model.dart';

class SearchRemoteDataSource {
  final String baseUrl = "https://www.episodate.com/api/";

  Future<List<SearchResultModel>> searchShows(String query, int page) async {
    final response = await http.get(Uri.parse('https://www.episodate.com/api/search?q=\$query&page=\$page'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body)['tv_shows'] as List;
      return data.map((json) => SearchResultModel.fromJson(json)).toList();
    } else {
      throw Exception("Failed to search shows");
    }
  }
}
