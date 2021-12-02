import 'package:flutter/material.dart';
import 'package:harry_challenge/screens/home_screen.dart';

void main() {
  runApp(HarryChallenge());
}

class HarryChallenge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.black,
          secondary: Colors.black,
        ),
      ),
      home: HomeScreen(),
    );
  }
}
