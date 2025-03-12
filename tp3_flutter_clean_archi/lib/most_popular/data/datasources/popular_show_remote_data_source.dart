import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/popular_show_model.dart';
class PopularShowRemoteDataSource {
  final String baseUrl = "https://www.episodate.com/api/";
  Future<List<PopularShowModel>> fetchPopularShows(int page) async {
    final response = await http.get(Uri.parse('\${baseUrl}most-popular?page=\$page'));
    if (response.statusCode == 200) {
      print("response.body: \${response.body}");
      final data = json.decode(response.body)['tv_shows'] as List;
      return data.map((json) => PopularShowModel.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load popular shows");
    }
  }
}