import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/bloc/movie_bloc.dart';
import 'package:movies/widgets/movie_item.dart';
import 'package:provider/provider.dart';
import 'package:movies/core/services/providers/main_provider.dart';

class MovieCategory extends StatelessWidget {
  final String title;
  final String genre;
  final String sortBy;
  final bool shouldShuffle;

  const MovieCategory({
    super.key,
    required this.title,
    required this.genre,
    this.sortBy = 'year',
    this.shouldShuffle = false,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MovieBloc>();

    //  call once after build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      bloc.add(
        FetchMovies(genre: genre, sortBy: sortBy, shouldShuffle: shouldShuffle),
      );
    });

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          _buildHeader(context),
          SizedBox(
            height: 250,

            child: BlocBuilder<MovieBloc, MovieState>(
              builder: (context, state) {
                if (state is MovieLoading) {
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.yellow),
                  );
                }

                if (state is MovieLoaded) {
                  final key = "${genre}_$sortBy";
                  final movies = state.moviesByKey[key];

                  if (movies == null) {
                    return const SizedBox();
                  }
                  return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: movies.length,
                    separatorBuilder: (_, index) => const SizedBox(width: 12),
                    itemBuilder: (_, index) => MovieItem(movie: movies[index]),
                  );
                }

                if (state is MovieError) {
                  return const Center(
                    child: Text("Error", style: TextStyle(color: Colors.red)),
                  );
                }

                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleLarge),

          GestureDetector(
            onTap: () {
              // Switch to Browse tab
              Provider.of<MainProvider>(context, listen: false).changeTab(2);

              // Fetch same category in full screen
              context.read<MovieBloc>().add(
                FetchMovies(
                  genre: genre,
                  sortBy: sortBy,
                  shouldShuffle: shouldShuffle,
                ),
              );
            },
            child: const Text(
              "See More",
              style: TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
