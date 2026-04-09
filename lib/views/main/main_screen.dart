import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/bloc/movie_bloc.dart';
import 'package:movies/core/services/providers/main_provider.dart';
import 'package:movies/data/repository/movie_repository.dart';
import 'package:movies/views/main/browse/browse_tab.dart';
import 'package:movies/views/main/home/home_tab.dart';
import 'package:movies/views/main/profile/profile_tab.dart';
import 'package:movies/views/main/search/search_tab.dart';
import 'package:movies/views/main/widgets/navbar_selection_icon.dart';
import 'package:movies/views/main/widgets/navbar_unselection_icon.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  static const String routeName = '/main';

  const MainScreen({super.key});

  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MainProvider>(context);

    List<Widget> tabs = const [
      HomeTab(),
      SearchTab(),
      BrowseTab(),
      ProfileTab(),
    ];

    return BlocProvider(
      create: (_) => MovieBloc(MovieRepository()),
      child: Scaffold(
        body: tabs[provider.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: provider.currentIndex,
          onTap: (index) {
            provider.changeTab(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: NavbarUnselectionIcon(iconName: 'home'),
              activeIcon: NavbarSelectionIcon(iconName: 'home'),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: NavbarUnselectionIcon(iconName: 'search'),
              activeIcon: NavbarSelectionIcon(iconName: 'search'),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: NavbarUnselectionIcon(iconName: 'browse'),
              activeIcon: NavbarSelectionIcon(iconName: 'browse'),
              label: 'Browse',
            ),
            BottomNavigationBarItem(
              icon: NavbarUnselectionIcon(iconName: 'profile'),
              activeIcon: NavbarSelectionIcon(iconName: 'profile'),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
