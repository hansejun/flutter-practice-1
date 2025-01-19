import 'package:assignment_2/models/movie_model.dart';
import 'package:assignment_2/screens/movie_detail_screen.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final double width;
  final double height;
  const MovieCard({
    super.key,
    required this.movie,
    required this.width,
    required this.height,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailScreen(
                    id: movie.id.toDouble(),
                    backgroundImage: movie.backdropPath)));
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        width: width,
        height: height,
        child: Image.network(
          'https://image.tmdb.org/t/p/w500${movie.posterPath}',
          headers: const {
            "User-Agent":
                "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
          },
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
