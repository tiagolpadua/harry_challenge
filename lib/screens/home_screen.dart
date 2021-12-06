import 'package:flutter/material.dart';
import 'package:harry_challenge/Managers/network_manager.dart';
import 'package:harry_challenge/components/centered_message.dart';
import 'package:harry_challenge/models/character.dart';
import 'package:harry_challenge/components/character_item.dart';
import 'package:harry_challenge/components/components.dart';
import 'package:harry_challenge/screens/favorite_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FavoriteScreen(),
            ),
          );
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
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    break;
                  case ConnectionState.waiting:
                    return Progress();
                  case ConnectionState.active:
                    break;
                  case ConnectionState.done:
                    if (snapshot.hasData) {
                      final List<Character> characters = snapshot.data ?? 0.0;
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          final Character character = characters[index];
                          return CharacterItem(character);
                        },
                      );
                    }
                }
                return CenteredMessage(
                  'No information found',
                  icon: Icons.warning,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
