import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:netflix/core/api_const.dart';

import 'package:netflix/model/model.dart';

String trendingMovies =
    "https://api.themoviedb.org/3/trending/movie/{time_window}?api_key=${ApiConstants.apikey}";
String horrorMovies =
    'https://api.themoviedb.org/3/discover/movie?api_key=${ApiConstants.apikey}&with_genres=27';
String comedyMovies =
    'https://api.themoviedb.org/3/discover/movie?api_key=${ApiConstants.apikey}&with_genres=35';
String actionMovies =
    'https://api.themoviedb.org/3/discover/movie?api_key=${ApiConstants.apikey}&with_genres=28';
String upcomingMovies =
    'https://api.themoviedb.org/3/discover/movie?api_key=${ApiConstants.apikey}&with_genres=36';

Future<List<Movie>> getTrendingMovies() async {
  final response = await http.get(Uri.parse(trendingMovies));
  if (response.statusCode == 200) {
    final dataAsJson = jsonDecode(response.body) as Map<String, dynamic>;
    final data = MovieList.fromJson(dataAsJson['results']);
    return data.movieList;
  } else {
    throw Exception('Try Again');
  }
}

Future<List<Movie>> getHorrorMovies() async {
  final response = await http.get(Uri.parse(horrorMovies));
  if (response.statusCode == 200) {
    final dataAsJson = jsonDecode(response.body) as Map<String, dynamic>;
    final data = MovieList.fromJson(dataAsJson['results']);
    return data.movieList;
  } else {
    throw Exception('Try Again');
  }
}

Future<List<Movie>> getComedyMovies() async {
  final response = await http.get(Uri.parse(comedyMovies));
  if (response.statusCode == 200) {
    final dataAsJson = jsonDecode(response.body) as Map<String, dynamic>;
    final data = MovieList.fromJson(dataAsJson['results']);
    return data.movieList;
  } else {
    throw Exception('try again');
  }
}

Future<List<Movie>> getActionMovies() async {
  final response = await http.get(Uri.parse(actionMovies));
  if (response.statusCode == 200) {
    final dataAsJson = jsonDecode(response.body) as Map<String, dynamic>;
    final data = MovieList.fromJson(dataAsJson['results']);
    return data.movieList;
  } else {
    throw Exception('try again');
  }
}

Future<List<Movie>> getUpComingMovies() async {
  final response = await http.get(Uri.parse(upcomingMovies));
  if (response.statusCode == 200) {
    final dataAsJson = jsonDecode(response.body) as Map<String, dynamic>;
    final data = MovieList.fromJson(dataAsJson['results']);
    return data.movieList;
  } else {
    throw Exception('try again');
  }
}
