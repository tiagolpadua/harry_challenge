import 'package:flutter/material.dart';
import 'package:harry_challenge/components/character.dart';

class CharacterItem extends StatelessWidget {

  // final Character character;
  //
  // CharacterItem(this.character);

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
              color: Colors.red.withOpacity(0.5),
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
                      image: NetworkImage('http://hp-api.herokuapp.com/images/harry.jpg'),
                    fit: BoxFit.fitWidth,
                  )
                ),
              ),
              SizedBox(width: 15.0,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Harry Potter',
                  style: TextStyle(
                    fontSize: 24.0,
                  ),),
                  Text('Gryffindor',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey.shade700,
                  ),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
