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
        primaryColor: Color(0xFF335c67),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color(0xFF335C67),
          secondary: Color(0xFFE09F3E),
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
