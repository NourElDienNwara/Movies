import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/bloc/movie_bloc.dart';
import 'package:movies/widgets/movie_item.dart';

class BrowseTab extends StatelessWidget {
  const BrowseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Browse")),
      body: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          if (state is MovieLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.yellow),
            );
          }

          if (state is MovieLoaded) {
            //  show ALL movies merged
            final allMovies = state.moviesByKey.values
                .expand((list) => list)
                .toList();

            if (allMovies.isEmpty) {
              return const Center(child: Text("No movies found"));
            }

            return ListView.builder(
              itemCount: allMovies.length,
              itemBuilder: (_, index) => MovieItem(movie: allMovies[index]),
            );
          }

          if (state is MovieError) {
            return const Center(
              child: Text(
                "Error loading movies",
                style: TextStyle(color: Colors.red),
              ),
            );
          }

          return const Center(child: Text("Select a category"));
        },
      ),
    );
  }
}
