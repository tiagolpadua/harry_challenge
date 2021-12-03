class Character {
  String name;
  String house;
  String actor;
  bool hogwartsStudent;
  String dateOfBirth;
  String eyeColour;
  bool isFavorite = false;
  String image;

  Character.name(this.name, this.house, this.actor, this.hogwartsStudent,
      this.dateOfBirth, this.eyeColour, this.isFavorite, this.image);

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
}