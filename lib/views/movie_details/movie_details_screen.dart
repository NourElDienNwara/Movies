import 'package:flutter/material.dart';
// import 'package:movies/views/main/main_screen.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});
  static const String routeName = '/MovieDetailsScreen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          actions: [],
        ),
        body: Center(child: Text('MovieDetailsScreen')),
      ),
    );
  }
}
