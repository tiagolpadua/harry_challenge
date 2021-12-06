import 'package:flutter/material.dart';

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
    case 'Gryffindor':
      return Colors.red.shade700;
    case 'Slytherin':
      return Colors.green.shade700;
    case 'Ravenclaw':
      return Colors.blue.shade700;
    case 'Hufflepuff':
      return Colors.yellow.shade700;
    default:
      return Colors.grey.shade700;
  }
}

Color eyeColor(String eyeColor) {
  switch (eyeColor) {
    case 'blue':
      return Colors.blue;
    case 'black':
      return Colors.black;
    case 'brown':
      return Colors.brown;
    case 'green':
      return Colors.green;
    case 'grey':
      return Colors.grey;
    case 'red':
      return Colors.red;
    case 'yellow':
      return Colors.yellow;
    default:
      return Colors.white60;
  }
}
