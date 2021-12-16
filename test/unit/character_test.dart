import 'package:flutter_test/flutter_test.dart';
import 'package:harry_challenge/models/character.dart';

main(){
  test('Should return Character Name', (){
    final character = Character('Harry Potter', 'Gryffindor', 'Daniel Radcliffe', true, '31-07-1980', 'green', 'http://hp-api.herokuapp.com/images/harry.jpg');
    expect(character.name, 'Harry Potter');
  });
  test('Should return Character Name', (){
    final character = Character('Harry Potter', 'Gryffindor', 'Daniel Radcliffe', true, '31-07-1980', 'green', 'http://hp-api.herokuapp.com/images/harry.jpg');
    expect(character.house, 'Gryffindor');
  });
  test('Should return Character Name', (){
    final character = Character('Harry Potter', 'Gryffindor', 'Daniel Radcliffe', true, '31-07-1980', 'green', 'http://hp-api.herokuapp.com/images/harry.jpg');
    expect(character.actor, 'Daniel Radcliffe');
  });
  test('Should return Character Name', (){
    final character = Character('Harry Potter', 'Gryffindor', 'Daniel Radcliffe', true, '31-07-1980', 'green', 'http://hp-api.herokuapp.com/images/harry.jpg');
    expect(character.hogwartsStudent, true);
  });
  test('Should return Character Name', (){
    final character = Character('Harry Potter', 'Gryffindor', 'Daniel Radcliffe', true, '31-07-1980', 'green', 'http://hp-api.herokuapp.com/images/harry.jpg');
    expect(character.dateOfBirth, '31-07-1980');
  });
  test('Should return Character Name', (){
    final character = Character('Harry Potter', 'Gryffindor', 'Daniel Radcliffe', true, '31-07-1980', 'green', 'http://hp-api.herokuapp.com/images/harry.jpg');
    expect(character.eyeColour, 'green');
  });
  test('Should return Character Name', (){
    final character = Character('Harry Potter', 'Gryffindor', 'Daniel Radcliffe', true, '31-07-1980', 'green', 'http://hp-api.herokuapp.com/images/harry.jpg');
    expect(character.image, 'http://hp-api.herokuapp.com/images/harry.jpg');
  });
}