import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavbarUnselectionIcon extends StatelessWidget {
  final String iconName;

  const NavbarUnselectionIcon({super.key, required this.iconName});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/$iconName.svg',
      width: 24,
      height: 24,
    );
  }
}
