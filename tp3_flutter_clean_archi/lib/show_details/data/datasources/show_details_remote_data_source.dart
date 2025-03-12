import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/show_details_model.dart';

class ShowDetailsRemoteDataSource {
  final String baseUrl = "https://www.episodate.com/api/";

  Future<ShowDetailsModel> fetchShowDetails(int id) async {
    final response = await http.get(Uri.parse('\${baseUrl}show-details?q=\$id'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body)['tvShow'];
      return ShowDetailsModel.fromJson(data);
    } else {
      throw Exception("Failed to load show details");
    }
  }
}