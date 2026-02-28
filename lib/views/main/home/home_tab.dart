import 'package:flutter/material.dart';
import 'package:movies/views/main/home/home_header.dart';
import 'package:movies/views/main/home/movie_category.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        /// Header
        SliverToBoxAdapter(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.67,
            child: HomeHeader(),
          ),
        ),

        /// Categories
        SliverToBoxAdapter(child: MovieCategory()),

        SliverToBoxAdapter(child: MovieCategory()),

        SliverToBoxAdapter(child: MovieCategory()),
      ],
    );
  }
}
