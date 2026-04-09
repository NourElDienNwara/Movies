import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/data/model/movie_model.dart';
import 'package:movies/data/repository/movie_repository.dart';

// Events
abstract class MovieEvent {}

class FetchMovies extends MovieEvent {
  final String? genre;
  final String? sortBy;
  final bool shouldShuffle;

  FetchMovies({this.genre, this.sortBy, this.shouldShuffle = false});
}

// States
abstract class MovieState {}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

//  UPDATED: store ALL categories
class MovieLoaded extends MovieState {
  final Map<String, List<Movie>> moviesByKey;

  MovieLoaded(this.moviesByKey);
}

class MovieError extends MovieState {
  final String message;
  MovieError(this.message);
}

// BLoC
class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository repository;

  // CACHE HERE
  final Map<String, List<Movie>> _cache = {};

  MovieBloc(this.repository) : super(MovieInitial()) {
    on<FetchMovies>((event, emit) async {
      final key = "${event.genre}_${event.sortBy}";

      // If already cached → return instantly
      if (_cache.containsKey(key)) {
        emit(MovieLoaded(Map.from(_cache)));
        return;
      }

      emit(MovieLoading());

      try {
        final movies = await repository.fetchMovies(
          genre: event.genre,
          sortBy: event.sortBy,
        );

        //  Shuffle ONLY first time
        if (event.shouldShuffle) {
          movies.shuffle();
        }

        // Save in cache
        _cache[key] = movies;

        emit(MovieLoaded(Map.from(_cache)));
      } catch (e) {
        emit(MovieError(e.toString()));
      }
    });
  }
}
