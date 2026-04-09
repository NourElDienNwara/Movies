import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/theme/app_theme.dart';
import 'package:movies/data/model/movie_model.dart';

class MovieHeader extends StatelessWidget {
  final Movie movie;

  const MovieHeader({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // 1. Background Image
        CachedNetworkImage(
          imageUrl: movie.backgroundImage,
          height: 500,
          width: double.infinity,
          fit: BoxFit.cover,
          // REDUCE THIS: 1000 was too high for a 500 height container on a 3x density screen
          memCacheHeight: 600,
          maxWidthDiskCache: 1000,
          errorWidget: (context, url, error) =>
              Container(color: Colors.grey[900]),
        ),
        //  Gradient Overlay (Height must match the image)
        Container(
          height: 500,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent, // Top transparent to see the faces
                AppTheme.darkColor.primary.withValues(alpha: 0.6),
                AppTheme.darkColor.primary.withValues(
                  alpha: 1.0,
                ), // Solid at bottom
              ],
            ),
          ),
        ),

        // Play Button
        Icon(Icons.play_circle_fill, size: 80, color: Colors.amber),

        // Back Button
        Positioned(
          top: 40,
          left: 16,
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),

        //  Bookmark Button
        Positioned(
          top: 40,
          right: 16,

          child: IconButton(
            icon: const Icon(Icons.bookmark_border, color: Colors.white),
            onPressed: () {},
          ),
        ),

        //  Title and Year positioned at the bottom
        Positioned(
          bottom: 20,
          left: 16,
          right: 16,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                movie.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
