import 'package:assignment_2/models/movie_model.dart';
import 'package:assignment_2/widgets/movie_card.dart';
import 'package:flutter/material.dart';

class MovieBlock extends StatelessWidget {
  const MovieBlock({
    super.key,
    required this.movies,
    required this.width,
    required this.height,
    required this.title,
    required this.hasTitle,
  });

  final Future<List<Movie>> movies;
  final double width;
  final double height;
  final String title;
  final bool hasTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        SizedBox(height: 10),
        FutureBuilder(
            future: movies,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SizedBox(
                  height: height + 20,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var movie = snapshot.data![index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MovieCard(
                            movie: movie,
                            width: width,
                            height: height,
                          ),
                          if (hasTitle)
                            SizedBox(
                              width: 130,
                              child: Text(
                                movie.title,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 10);
                    },
                    itemCount: snapshot.data!.length,
                  ),
                );
              }

              return Center(
                child: CircularProgressIndicator(),
              );
            })
      ],
    );
  }
}
