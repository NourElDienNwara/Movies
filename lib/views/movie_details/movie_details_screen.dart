import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movies/views/movie_details/movie_header.dart';
import 'package:movies/widgets/movie_item.dart';
import '../../data/model/movie_model.dart';
import '../../data/repository/movie_repository.dart';

class MovieDetailsScreen extends StatelessWidget {
  static const String routeName = "movie-details";
  final int movieId;

  const MovieDetailsScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    final repo = MovieRepository();

    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: Future.wait([
          repo.fetchMovieDetails(movieId),
          repo.fetchSimilarMovies(movieId),
        ]),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.amber),
            );
          }

          if (snapshot.hasError || !snapshot.hasData) {
            return const Center(
              child: Text(
                "Error loading movie details",
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          final Movie movie = snapshot.data![0];
          final List<Movie> similar = snapshot.data![1];

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MovieHeader(movie: movie),
                _buildTitleSection(movie),
                _buildStatsRow(movie),
                _buildSection("Screen Shots", _buildScreenshots(movie)),
                _buildSection("Similar", _buildSimilarGrid(similar)),
                _buildSection("Summary", _buildSummary(movie)),
                _buildSection("Cast", _buildCastList(movie)),
                _buildSection("Genres", _buildGenreChips(movie)),
                const SizedBox(height: 40),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildTitleSection(Movie movie) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(movie.year, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text("Watch", style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsRow(Movie movie) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _statItem(Icons.favorite, "15", Colors.amber),
        _statItem(Icons.timer, "120", Colors.amber),
        _statItem(Icons.star, movie.rating.toString(), Colors.amber),
      ],
    );
  }

  Widget _statItem(IconData icon, String text, Color color) {
    return Row(
      children: [
        Container(
          width: 70,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: color, size: 20),
              const SizedBox(width: 6),
              Text(text, style: const TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ],
    );
  }

  // SCREENSHOTS: Horizontal scroll fix
  Widget _buildScreenshots(Movie movie) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: movie.screenshots.length,
        itemBuilder: (_, i) => Padding(
          padding: const EdgeInsets.only(right: 12),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: movie.screenshots[i],
              width: 240,
              fit: BoxFit.cover,
              memCacheWidth: 500, // Optimization
            ),
          ),
        ),
      ),
    );
  }

  // SIMILAR: Performance optimized row-based layout (No shrinkWrap GridView)
  Widget _buildSimilarGrid(List<Movie> similar) {
    if (similar.isEmpty) return const SizedBox();
    final list = similar.take(4).toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: _similarPoster(list[0])),
              const SizedBox(width: 12),
              Expanded(
                child: list.length > 1
                    ? _similarPoster(list[1])
                    : const SizedBox(),
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (list.length > 2)
            Row(
              children: [
                Expanded(child: _similarPoster(list[2])),
                const SizedBox(width: 12),
                Expanded(
                  child: list.length > 3
                      ? _similarPoster(list[3])
                      : const SizedBox(),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _similarPoster(Movie movie) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: MovieItem(movie: movie),
    );
  }

  Widget _buildSummary(Movie movie) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        movie.descriptionFull.isEmpty
            ? "No summary available."
            : movie.descriptionFull,
        style: const TextStyle(color: Colors.white70, height: 1.5),
      ),
    );
  }

  Widget _buildCastList(Movie movie) {
    return Column(
      children: movie.cast.map((c) {
        return Card(
          color: Colors.white10,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: 50,
                height: 50,
                color: Colors.white24,
                child: c.urlSmallImage != null
                    ? CachedNetworkImage(
                        imageUrl: c.urlSmallImage!,
                        fit: BoxFit.cover,
                        memCacheWidth: 150,
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.person, color: Colors.grey),
                      )
                    : const Icon(Icons.person, color: Colors.grey),
              ),
            ),
            title: Text(
              "Name: ${c.name}",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            subtitle: Text(
              "Character: ${c.characterName}",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildGenreChips(Movie movie) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Wrap(
        spacing: 8,
        children: movie.genres
            .map(
              (g) => Chip(
                backgroundColor: Color(0xFF333333),
                side: BorderSide.none,
                label: Text(
                  g,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildSection(String title, Widget content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        content,
      ],
    );
  }
}
