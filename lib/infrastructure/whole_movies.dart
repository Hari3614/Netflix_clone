import 'dart:convert';

import 'package:netflix/core/api_const.dart';
import 'package:netflix/model/model.dart';
import 'package:http/http.dart' as http;

String trendingMovies =
    "https://api.themoviedb.org/3/discover/movie?api_key=${ApiConstants.apikey}";

Future<List<Movie>> getAllMovies() async {
  final response = await http.get(Uri.parse(trendingMovies));
  if (response.statusCode == 200) {
    final dataAsJson = jsonDecode(response.body) as Map<String, dynamic>;
    final data = MovieList.fromJson(dataAsJson['results']);
    print('the data of all movies is $data.movieList');
    return data.movieList;
  } else {
    throw Exception('Try Again');
  }
}

Future<List<Movie>> searchdata(String value) async {
  final url =
      "https://api.themoviedb.org/3/search/movie?api_key=${ApiConstants.apikey}&query=$value";
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final dataAsJson = jsonDecode(response.body) as Map<String, dynamic>;
    final data = MovieList.fromJson(dataAsJson['results']);

    return data.movieList;
  } else {
    throw Exception('try again');
  }
}
