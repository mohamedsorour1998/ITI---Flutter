// Service class to fetch movies from the API

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie.dart';

class MovieService {
  static const String apiKey = 'fe32a5db54bad1ad4834c540a6400185';
  static const String baseUrl = 'https://api.themoviedb.org/3/movie';
  static const String imageBaseUrl = 'http://image.tmdb.org/t/p/w500';

  Future<List<Movie>> fetchMovies(String sortBy) async {
    final response =
        await http.get(Uri.parse('$baseUrl/$sortBy?api_key=$apiKey'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body)['results'];
      return data.map<Movie>((item) => Movie.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
