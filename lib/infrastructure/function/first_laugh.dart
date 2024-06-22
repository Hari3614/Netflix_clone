import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:netflix/core/api_const.dart';
import 'package:netflix/model/model.dart';
import 'package:http/http.dart' as http;

String firstlaughMovies =
    'https://api.themoviedb.org/3/discover/movie?api_key=${ApiConstants.apikey}&with_genres=28';

Future<List<Movie>> getFirstLaugh() async {
  final response = await http.get(Uri.parse(firstlaughMovies));
  if (response.statusCode == 200) {
    final dataAsJson = jsonDecode(response.body) as Map<String, dynamic>;
    final data = MovieList.fromJson(dataAsJson['results']);
    return data.movieList;
  } else {
    throw Exception(const Text('Something Went Wrong'));
  }
}
