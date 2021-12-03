import 'package:flutter/material.dart';
import 'package:harry_challenge/Magagers/network_manager.dart';
import 'package:harry_challenge/components/character.dart';
import 'package:harry_challenge/components/character_item.dart';

class HomeScreen extends StatelessWidget {

  final NetworkManager _networkManager = NetworkManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Harry Challenge',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _networkManager.getData();
        },
        child: Icon(Icons.favorite),
      ),
      body: Column(
        children: [
          Image.asset('assets/images/harry_potter.png'),
          Expanded(
            child: ListView(
              children: [
                CharacterItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
