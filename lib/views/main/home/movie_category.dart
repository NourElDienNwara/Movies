import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/core/theme/app_theme.dart';
import 'package:movies/widgets/movie_item.dart';

class MovieCategory extends StatelessWidget {
  const MovieCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Category Header
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Action',
                  style: textTheme.titleLarge!.copyWith(
                    color: AppTheme.darkColor.white,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Text(
                        'See More',
                        style: textTheme.titleMedium!.copyWith(
                          color: AppTheme.darkColor.bottom,
                        ),
                      ),
                      SizedBox(width: 6),
                      SvgPicture.asset(
                        'assets/icons/arrow2.svg',
                        width: 8,
                        height: 8,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 6),

          /// Horizontal Movie List
          SizedBox(
            height: size.height * 0.24,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 16),
              itemCount: 10,
              itemBuilder: (_, index) => MovieItem(),
              separatorBuilder: (_, index) => SizedBox(width: 16),
            ),
          ),
        ],
      ),
    );
  }
}
