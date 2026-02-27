import 'package:flutter/material.dart';
import 'package:movies/views/main/browse/browse_tap.dart';
import 'package:movies/views/main/home/home_tap.dart';
import 'package:movies/views/main/profile/profile_tap.dart';
import 'package:movies/views/main/search/search_tap.dart';
import 'package:movies/views/main/widgets/navbar_selection_icon.dart';
import 'package:movies/views/main/widgets/navbar_unselection_icon.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = '/main';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  List<Widget> tap = [HomeTap(), SearchTap(), BrowseTap(), ProfileTap()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tap[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() {
          currentIndex = index;
        }),
        items: [
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
    );
  }
}
