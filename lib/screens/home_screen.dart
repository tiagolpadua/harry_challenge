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
        },
        child: Icon(Icons.favorite),
      ),
      body: Column(
        children: [
          Image.asset('assets/images/harry_potter.png'),
          Expanded(
            child: FutureBuilder<dynamic>(
              future: _networkManager.getData(),
              builder: (context, snapshot) {
                final List<Character> characters = snapshot.data ?? 0.0;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final Character character = characters[index];
                    return CharacterItem(character);
                  },);
              },
            ),
          ),
        ],
      ),
    );
  }
}
