import 'package:flutter/material.dart';

class ProfileTap extends StatelessWidget {
  const ProfileTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Profile Tap', style: Theme.of(context).textTheme.titleLarge));
  }
}