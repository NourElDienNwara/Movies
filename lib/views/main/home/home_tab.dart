import 'package:flutter/material.dart';
import 'package:movies/views/main/home/home_header.dart';
import 'package:movies/views/main/home/movie_category.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.67,
            child: const HomeHeader(),
          ),
        ),
        SliverToBoxAdapter(
          child: MovieCategory(title: "Action", genre: "Action"),
        ),
        SliverToBoxAdapter(
          child: MovieCategory(title: "Animation", genre: "Animation"),
        ),
        SliverToBoxAdapter(
          child: MovieCategory(title: "Sci-Fi", genre: "Sci-Fi"),
        ),
      ],
    );
  }
}
