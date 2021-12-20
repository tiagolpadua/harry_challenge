import 'package:flutter/material.dart';

class Character {
  String name;
  String house;
  String actor;
  bool hogwartsStudent;
  String dateOfBirth;
  String eyeColour;
  String image;

  Character(this.name, this.house, this.actor, this.hogwartsStudent,
      this.dateOfBirth, this.eyeColour, this.image);

  Map<String, Color> setEyeColor() =>
  {
    'green': Colors.green,
    'brown': Colors.brown,
    'grey': Colors.grey,
    'blue': Colors.blue,
    'black': Colors.black,
    'red': Colors.red,
    'amber': Colors.amber,
    '': Colors.black
  };

  Character.fromJson(Map<String, dynamic> json)
  : name = json['name'],
    house = json['house'],
    actor = json['actor'],
    hogwartsStudent = json['hogwartsStudent'],
    dateOfBirth = json['dateOfBirth'],
    eyeColour = json['eyeColour'],
    image = json['image'];

  @override
  String toString() {
    return 'Character: name: $name, house: $house';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Character &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => name.hashCode;
}