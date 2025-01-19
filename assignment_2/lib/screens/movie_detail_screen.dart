import 'package:assignment_2/models/movie_detail.dart';
import 'package:assignment_2/services/api.dart';
import 'package:assignment_2/widgets/rating_stars.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final double id;
  final String backgroundImage;

  const DetailScreen(
      {super.key, required this.id, required this.backgroundImage});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<MovieDetail> movieDetail;

  @override
  void initState() {
    super.initState();
    movieDetail = ApiService().getMovieDetail(widget.id.toInt());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Back to list',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        centerTitle: false,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://image.tmdb.org/t/p/original${widget.backgroundImage}'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.black.withValues(alpha: .4), // 투명도 설정
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 250),
                      FutureBuilder(
                        future: movieDetail,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return DefaultTextStyle(
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(snapshot.data!.title,
                                      style: TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                  SizedBox(height: 10),
                                  RatingStars(
                                      voteAverage: snapshot.data!.voteAverage),
                                  SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Text(snapshot.data!.runtime.toString()),
                                      SizedBox(width: 5),
                                      Text('|'),
                                      SizedBox(width: 5),
                                      Text(snapshot.data!.genres
                                          .map((e) => e.name)
                                          .toList()
                                          .join(', ')),
                                    ],
                                  ),
                                  SizedBox(height: 40),
                                  Text('Storyline',
                                      style: TextStyle(
                                          fontSize: 26,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                  SizedBox(height: 10),
                                  Text(snapshot.data!.overview,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                            );
                          }
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // 버튼 클릭 이벤트 처리
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Buy ticket',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
