// Widget to display movie poster.
import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../services/movie_service.dart';

class MoviePoster extends StatelessWidget {
  final Movie movie;

  MoviePoster({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      MovieService.imageBaseUrl + movie.posterPath,
      fit: BoxFit.cover,
    );
  }
}
