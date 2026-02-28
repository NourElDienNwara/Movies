import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/theme/app_theme.dart';
import 'package:movies/widgets/movie_item.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        /// Background Image
        Positioned.fill(
          child: Image.asset('assets/images/1917_movie.png', fit: BoxFit.cover),
        ),

        /// Gradient Overlay
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppTheme.darkColor.primary.withValues(alpha: 0.6),
                AppTheme.darkColor.primary.withValues(alpha: 0.8),
              ],
            ),
          ),
        ),

        /// Content
        SafeArea(
          child: Column(
            children: [
              /// Header Logo/Image
              Image.asset('assets/images/home_header.png', fit: BoxFit.fill),
              SizedBox(height: size.height * 0.02),

              /// Movie Carousel
              Expanded(
                child: CarouselSlider.builder(
                  itemCount: 50,
                  itemBuilder: (_, index, _) => MovieItem(),
                  options: CarouselOptions(
                    height: size.height * 50,
                    viewportFraction: 0.45,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.39,
                  ),
                ),
              ),

              /// Middle Decoration Image
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
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
  }
}
