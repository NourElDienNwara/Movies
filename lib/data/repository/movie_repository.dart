import 'package:dio/dio.dart';
import 'package:movies/data/model/movie_model.dart';

class MovieRepository {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://movies-api.accel.li/api/v2/",
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  Future<List<Movie>> fetchMovies({
    String? genre,
    String? sortBy,
    int page = 1,
    String? queryTerm,
    int? minRating,
  }) async {
    try {
      final response = await _dio.get(
        'list_movies.json',
        queryParameters: {
          'limit': 20,
          'page': page,
          ...?(genre != null && genre != 'All') ? {'genre': genre} : null,
          ...?(sortBy != null) ? {'sort_by': sortBy} : null,
          ...?(queryTerm != null && queryTerm.isNotEmpty)
              ? {'query_term': queryTerm}
              : null,
          ...?(minRating != null) ? {'minimum_rating': minRating} : null,
        },
      );

      if (response.data['status'] == 'ok') {
        final Map<String, dynamic> data = response.data['data'];
        final List? moviesJson = data['movies'];

        if (moviesJson == null) return [];

        return moviesJson.map((m) => Movie.fromJson(m)).toList();
      } else {
        throw Exception(response.data['status_message'] ?? "Unknown API Error");
      }
    } on DioException catch (e) {
      throw Exception("Network Error: ${e.message}");
    } catch (e) {
      throw Exception("Failed to fetch movies: $e");
    }
  }

  Future<Movie> fetchMovieDetails(int movieId) async {
    try {
      final response = await _dio.get(
        'movie_details.json',
        queryParameters: {
          'movie_id': movieId,
          'with_images': true,
          'with_cast': true,
        },
      );

      if (response.data['status'] == 'ok') {
        return Movie.fromJson(response.data['data']['movie']);
      } else {
        throw Exception(response.data['status_message'] ?? "API Error");
      }
    } catch (e) {
      throw Exception("Failed to load details: $e");
    }
  }

  Future<List<Movie>> fetchSimilarMovies(int movieId) async {
    try {
      final response = await _dio.get(
        'movie_suggestions.json',
        queryParameters: {'movie_id': movieId},
      );

      if (response.data['status'] == 'ok') {
        final List? moviesJson = response.data['data']['movies'];
        return moviesJson?.map((m) => Movie.fromJson(m)).toList() ?? [];
      }
      return [];
    } catch (e) {
      return [];
    }
  }
}
