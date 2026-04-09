import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/bloc/movie_bloc.dart';
import 'package:movies/core/theme/app_theme.dart';
import 'package:movies/data/repository/movie_repository.dart';
import 'package:movies/widgets/movie_item.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) =>
          MovieBloc(MovieRepository())..add(FetchMovies(sortBy: 'rating')),
      child: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          return Stack(
            children: [
              Positioned.fill(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: Image.asset(
                    'assets/images/1917_movie.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),

              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppTheme.darkColor.primary.withValues(alpha: 0.6),
                      AppTheme.darkColor.primary.withValues(alpha: 0.95),
                    ],
                  ),
                ),
              ),

              SafeArea(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/home_header.png',
                      fit: BoxFit.fill,
                    ),
                    SizedBox(height: size.height * 0.02),

                    Expanded(child: _buildCarousel(state, size)),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.1,
                        vertical: 10,
                      ),
                      child: Image.asset(
                        'assets/images/mid_image.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildCarousel(MovieState state, Size size) {
    if (state is MovieLoading) {
      return const Center(
        child: CircularProgressIndicator(color: Colors.amber),
      );
    } else if (state is MovieLoaded) {
      final movies = state.moviesByKey["null_rating"];

      if (movies == null) return const SizedBox();

      return CarouselSlider.builder(
        itemCount: movies.length,
        itemBuilder: (_, index, _) => MovieItem(movie: movies[index]),
        options: CarouselOptions(
          height: size.height * 0.50,
          viewportFraction: 0.40,
          enlargeCenterPage: true,
          enlargeFactor: 0.36,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 5),
        ),
      );
    } else if (state is MovieError) {
      return Center(
        child: Text(state.message, style: const TextStyle(color: Colors.white)),
      );
    }
    return const SizedBox();
  }
}
