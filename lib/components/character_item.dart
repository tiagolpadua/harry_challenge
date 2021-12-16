import 'package:flutter/material.dart';
import 'package:harry_challenge/models/character.dart';
import 'package:harry_challenge/screens/character_screen.dart';

import 'components.dart';

class CharacterItem extends StatelessWidget {
  final Character character;

  CharacterItem(this.character);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => CharacterScreen(character),),);
        },
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
              mainAxisSize: MainAxisSize.min,
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
      ),
    );
  }
}
