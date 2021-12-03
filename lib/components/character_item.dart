import 'package:flutter/material.dart';
import 'package:harry_challenge/components/character.dart';

class CharacterItem extends StatelessWidget {
  final Character character;

  CharacterItem(this.character);

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          boxShadow: [
            BoxShadow(
              color: getHouseColor(character.house),
              spreadRadius: 2,
              blurRadius: 1,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(character.image),
                      fit: BoxFit.fitWidth,
                    )),
              ),
              SizedBox(
                width: 15.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    character.name,
                    style: TextStyle(
                      fontSize: 24.0,
                    ),
                  ),
                  Text(
                    character.house,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
