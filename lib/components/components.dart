
import 'package:flutter/material.dart';
import 'package:harry_challenge/database/character_dao.dart';
import 'package:harry_challenge/models/favorite_character.dart';

final String url = 'http://hp-api.herokuapp.com/api/characters';

class Progress extends StatelessWidget {

  final String message;

  Progress({this.message = 'Loading'});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [CircularProgressIndicator(), Text(message)],
      ),
    );
  }
}

Color getHouseColor(String house) {
  switch (house) {
    case "Gryffindor":
      return Colors.red.shade700;
    case "Slytherin":
      return Colors.green.shade700;
    case "Ravenclaw":
      return Colors.blue.shade700;
    case "Hufflepuff":
      return Colors.yellow.shade700;
    default:
      return Colors.grey.shade700;
  }
}

