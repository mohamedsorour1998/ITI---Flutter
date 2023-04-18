// Movie list screen to display movie posters in a grid.
import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../services/movie_service.dart';
import '../widgets/movie_poster.dart';
import '../widgets/settings_dialog.dart';
import 'movie_details_screen.dart';

class MovieListScreen extends StatefulWidget {
  @override
  _MovieListScreenState createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  List<Movie> _movies = [];
  String _sortBy = 'popular';

  @override
  void initState() {
    super.initState();
    _fetchMovies();
  }

  Future<void> _fetchMovies() async {
    try {
      List<Movie> movies = await MovieService().fetchMovies(_sortBy);
      setState(() {
        _movies = movies;
      });
    } catch (e) {
      // Handle the error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie App'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () async {
              final String? sortBy = await showSettingsDialog(context);
              if (sortBy != null) {
                setState(() {
                  _sortBy = sortBy;
                });
                _fetchMovies();
              }
            },
          ),
        ],
      ),
      body: GridView.builder(
        itemCount: _movies.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (BuildContext context, int index) {
          final movie = _movies[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetailsScreen(movie: movie),
                ),
              );
            },
            child: GridTile(
              child: MoviePoster(movie: movie),
            ),
          );
        },
      ),
    );
  }
}
