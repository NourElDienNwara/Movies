import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavbarSelectionIcon extends StatelessWidget {
  final String iconName;

  const NavbarSelectionIcon({super.key, required this.iconName});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/$iconName.svg',
      width: 24,
      height: 24,
      colorFilter: .mode(Colors.yellow, BlendMode.srcIn),
    );
  }
}
