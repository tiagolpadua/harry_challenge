class FavoriteCharacter {
  String name;
  int favorite;


  FavoriteCharacter(this.name, this.favorite);

  @override
  String toString() {
    return 'Favorite Character: $name, $favorite';
  }
}
