import 'package:flutter/material.dart';
import 'package:harry_challenge/Managers/network_manager.dart';
import 'package:harry_challenge/database/character_dao.dart';
import 'package:harry_challenge/screens/home_screen.dart';
import 'package:harry_challenge/widgets/app_dependencies.dart';

void main() async {
  runApp(HarryChallenge(characterDao: CharacterDao(), networkManager: NetworkManager()));
}

class HarryChallenge extends StatelessWidget {

  final CharacterDao characterDao;
  final NetworkManager networkManager;


  HarryChallenge({required this.characterDao, required this.networkManager});

  @override
  Widget build(BuildContext context) {
    return AppDependencies(
      characterDao: characterDao,
      networkManager: networkManager,
      child: MaterialApp(
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
      ),
    );
  }
}
