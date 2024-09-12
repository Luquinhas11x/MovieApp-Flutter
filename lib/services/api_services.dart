
import 'dart:convert';

import 'package:movieapp_checkpoint4/common/utils.dart';
import 'package:movieapp_checkpoint4/models/movie_model.dart';
import 'package:http/http.dart' as http;

const baseUrl = 'https://api.themoviedb.org/3/';
const key = '?api_key=$apiKey';

class ApiServices {
  Future<Result> getTopRatedMovies() async {
    var endPoint = 'movie/top_rated';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return Result.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load now playing movies');
  }

  Future<Result> getPopularMovies() async {
    const endPoint = 'movie/popular';
    const url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url), headers: {});
    if (response.statusCode == 200) {
      return Result.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load now playing movies');
  }
}
