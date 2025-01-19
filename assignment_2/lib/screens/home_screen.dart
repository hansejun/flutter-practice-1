import 'package:assignment_2/models/movie_block.dart';
import 'package:assignment_2/models/movie_model.dart';
import 'package:assignment_2/services/api.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<Movie>> popular_movies = ApiService().getPopular();
  final Future<List<Movie>> now_playing_movies = ApiService().getNowPlaying();
  final Future<List<Movie>> coming_soon_movies = ApiService().getComingSoon();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
      child: Column(
        children: [
          SizedBox(height: 30),
          MovieBlock(
            movies: popular_movies,
            width: 300,
            height: 200,
            title: 'Popular Movies',
            hasTitle: false,
          ),
          SizedBox(height: 20),
          MovieBlock(
            movies: now_playing_movies,
            width: 150,
            height: 150,
            title: 'Now Playing Movies',
            hasTitle: true,
          ),
          SizedBox(height: 20),
          MovieBlock(
            movies: coming_soon_movies,
            width: 150,
            height: 150,
            title: 'Coming Soon',
            hasTitle: true,
          ),
        ],
      ),
    )));
  }
}
