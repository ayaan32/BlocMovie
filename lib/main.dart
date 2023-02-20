import 'package:moviet/Screens/Movie_detail_screen.dart';
import 'package:moviet/Screens/movie_screen.dart';
import 'package:moviet/Screens/selection_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'moviet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF203341),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SelectionScreen(),
    );
  }
}
