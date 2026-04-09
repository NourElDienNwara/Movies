import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/bloc/movie_bloc.dart';
import 'package:movies/widgets/movie_item.dart';

class BrowseTab extends StatefulWidget {
  const BrowseTab({super.key});
  static const String routeName = "movie-details";

  @override
  State<BrowseTab> createState() => _BrowseTabState();
}

class _BrowseTabState extends State<BrowseTab> {
  final List<String> genres = [
    "Action",
    "Adventure",
    "Animation",
    "Biography",
    "Comedy",
    "Crime",
    "Drama",
  ];

  String selectedGenre = "Action";

  @override
  void initState() {
    super.initState();

    context.read<MovieBloc>().add(FetchMovies(genre: selectedGenre));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemCount: genres.length,
                itemBuilder: (context, index) {
                  final genre = genres[index];
                  final bool isSelected = selectedGenre == genre;

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 10,
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectedGenre = genre;
                        });
                        context.read<MovieBloc>().add(
                          FetchMovies(genre: genre),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.amber : Colors.transparent,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: Colors.amber, width: 2),
                        ),
                        child: Text(
                          genre,
                          style: TextStyle(
                            color: isSelected ? Colors.black : Colors.amber,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            Expanded(
              child: BlocBuilder<MovieBloc, MovieState>(
                builder: (context, state) {
                  if (state is MovieLoading) {
                    return const Center(
                      child: CircularProgressIndicator(color: Colors.amber),
                    );
                  }

                  if (state is MovieLoaded) {
                    final currentKey = "${selectedGenre}_null";
                    final movies = state.moviesByKey[currentKey] ?? [];

                    if (movies.isEmpty) {
                      return const Center(
                        child: Text(
                          "No movies found",
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }

                    return GridView.builder(
                      padding: const EdgeInsets.all(15),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                            childAspectRatio: 0.7,
                          ),
                      itemCount: movies.length,
                      itemBuilder: (context, index) =>
                          MovieItem(movie: movies[index]),
                    );
                  }

                  if (state is MovieError) {
                    return Center(
                      child: Text(
                        state.message,
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  }

                  return SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
