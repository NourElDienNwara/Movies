import 'package:flutter/material.dart';
import 'package:movies/core/theme/app_theme.dart';
import 'package:movies/views/movie_details/movie_details_screen.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, MovieDetailsScreen.routeName);
      },
      child: Stack(
        children: [
          /// Movie Poster
          Card(
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            clipBehavior: Clip.antiAlias,
            child: AspectRatio(
              aspectRatio: 2 / 3,
              child: Image(
                image: AssetImage('assets/images/1917_movie.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// Rating Badge
          Positioned(
            top: 11,
            left: 9,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
              decoration: BoxDecoration(
                color: AppTheme.darkColor.primary.withValues(alpha: 0.7),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Text('7.7', style: textTheme.titleMedium),
                  SizedBox(width: 4),
                  Icon(Icons.star, color: AppTheme.darkColor.bottom, size: 15),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
