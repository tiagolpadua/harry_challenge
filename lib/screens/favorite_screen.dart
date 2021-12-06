import 'package:flutter/material.dart';
import 'package:harry_challenge/components/centered_message.dart';
import 'package:harry_challenge/components/components.dart';
import 'package:harry_challenge/database/character_dao.dart';
import 'package:harry_challenge/models/favorite_character.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {

  final CharacterDao _dao = CharacterDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorites Characters',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Image.asset('assets/images/harry_potter.png'),
          Expanded(
              child: FutureBuilder<dynamic>(
                initialData: [],
                future: _dao.getFavoriteCharacters(),
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
                        final List<FavoriteCharacter> characters = snapshot.data ?? 0.0;
                        return ListView.builder(
                          itemCount: characters.length,
                          itemBuilder: (context, index) {
                            final FavoriteCharacter character = characters[index];
                            return FavoriteItem(character);
                          },
                        );
                      }
                  }
                  return CenteredMessage(
                    'No favorites characters.',
                    icon: Icons.favorite,
                  );
                },
              ),
          ),
        ],
      ),
    );
  }
}

class FavoriteItem extends StatelessWidget {
  final FavoriteCharacter favoriteCharacter;

  FavoriteItem(this.favoriteCharacter);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        child: ListTile(
          title: Text(favoriteCharacter.name, style: TextStyle(fontSize: 20),),
        ),
      ),
    );
  }
}