import 'dart:convert';

import 'package:assignment_2/models/movie_detail.dart';
import 'package:assignment_2/models/movie_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://movies-api.nomadcoders.workers.dev';

  Future<List<Movie>> getPopular() async {
    try {
      final url = Uri.parse('$baseUrl/popular');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        if (json['results'] == null) return [];
        print(json['results']);
        final List<Movie> movies =
            (json['results'] as List).map((e) => Movie.fromJson(e)).toList();
        return movies;
      }
      return [];
    } catch (e) {
      throw Exception('인기 영화 데이터를 불러오는데 실패했습니다: $e');
    }
  }

  Future<List<Movie>> getNowPlaying() async {
    final url = Uri.parse('$baseUrl/now-playing');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      if (json['results'] == null) return [];

      final List<Movie> movies =
          (json['results'] as List).map((e) => Movie.fromJson(e)).toList();
      return movies;
    }
    throw Exception('현재 상영 중인 영화 데이터를 불러오는데 실패했습니다.');
  }

  Future<List<Movie>> getComingSoon() async {
    final url = Uri.parse('$baseUrl/coming-soon');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      return (json['results'] as List).map((e) => Movie.fromJson(e)).toList();
    }
    throw Exception('개봉 예정 영화 데이터를 불러오는데 실패했습니다.');
  }

  Future<MovieDetail> getMovieDetail(int id) async {
    final url = Uri.parse('$baseUrl/movie?id=$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      return MovieDetail.fromJson(json);
    }
    throw Exception('영화 상세 정보를 불러오는데 실패했습니다.');
  }
}
