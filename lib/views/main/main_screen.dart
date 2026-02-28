import 'package:flutter/material.dart';
import 'package:movies/core/services/providers/main_provider.dart';
import 'package:movies/views/main/browse/browse_tab.dart';
import 'package:movies/views/main/home/home_tab.dart';
import 'package:movies/views/main/profile/profile_tab.dart';
import 'package:movies/views/main/search/search_tab.dart';
import 'package:movies/views/main/widgets/navbar_selection_icon.dart';
import 'package:movies/views/main/widgets/navbar_unselection_icon.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = '/main';

  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> tabs = [HomeTab(), SearchTab(), BrowseTab(), ProfileTab()];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MainProvider>(context);
    return Scaffold(
      body: tabs[provider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: provider.currentIndex,
        onTap: (index) {
          provider.changeTab(index);
        },
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
