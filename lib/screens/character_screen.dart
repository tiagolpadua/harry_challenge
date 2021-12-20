import 'package:flutter/material.dart';
import 'package:harry_challenge/models/character.dart';
import 'package:harry_challenge/components/components.dart';
import 'package:harry_challenge/models/favorite_character.dart';
import 'package:harry_challenge/components/liked_item.dart';
import 'package:harry_challenge/widgets/app_dependencies.dart';

class CharacterScreen extends StatefulWidget {
  final Character character;

  CharacterScreen(this.character);

  @override
  _CharacterScreenState createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {

  int getFavoriteStatus(results) {
    int favorite = 0;
    for (FavoriteCharacter result in results) {
      if (result.name == widget.character.name) {
        favorite = result.favorite;
      }
    }
    return favorite;
  }

  @override
  Widget build(BuildContext context) {
    final dependencies = AppDependencies.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.character.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: getHouseColor(widget.character.house),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.network(
                    widget.character.image != '' ? widget.character.image : harryPotterLogoImage,
                    width: 120.0,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.character.name,
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          widget.character.house,
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: FutureBuilder<List<FavoriteCharacter>>(
                        future: dependencies!.characterDao.getFavoriteCharacters(),
                        builder: (context, snapshot) {
                          final List<FavoriteCharacter> favoriteCharacters =
                              snapshot.data ?? [];
                          int _favorite = getFavoriteStatus(favoriteCharacters);
                          return Align(
                            alignment: Alignment.centerRight,
                            child: Liked(
                              isSelected: _favorite == 0 ? false : true,
                              onClick: () {
                                setState(
                                  () {
                                    if (_favorite == 0) {
                                      _favorite = 1;
                                      dependencies.characterDao.save(
                                        FavoriteCharacter(
                                          widget.character.name,
                                          _favorite,
                                        ),
                                      );
                                    } else {
                                      _favorite = 0;
                                      dependencies.characterDao.delete(widget.character.name);
                                    }
                                  },
                                );
                              },
                            ),
                          );
                        }),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Divider(),
              SizedBox(
                height: 15,
              ),
              InformationText('Nome', widget.character.name),
              SizedBox(
                height: 10,
              ),
              InformationText('Casa', widget.character.house),
              SizedBox(
                height: 10,
              ),
              InformationText('Ator(a)', widget.character.actor),
              SizedBox(
                height: 10,
              ),
              InformationText(
                  'Aluno(a)', widget.character.hogwartsStudent ? 'Sim' : 'Não'),
              SizedBox(
                height: 10,
              ),
              InformationText('Aniversário', widget.character.dateOfBirth),
              SizedBox(
                height: 10,
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black, fontSize: 22),
                  children: [
                    TextSpan(
                        text: 'Cor dos olhos: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    WidgetSpan(
                      child: Icon(
                        Icons.remove_red_eye,
                        color: eyeColor(widget.character.eyeColour),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InformationText extends StatelessWidget {
  final String title;
  final String information;

  InformationText(this.title, this.information);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(color: Colors.black, fontSize: 22),
        children: <TextSpan>[
          TextSpan(
              text: '$title: ', style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: information),
        ],
      ),
    );
  }
}
