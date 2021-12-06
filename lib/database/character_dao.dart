import 'package:harry_challenge/database/app_database.dart';
import 'package:harry_challenge/models/favorite_character.dart';
import 'package:sqflite/sqflite.dart';

class CharacterDao {
  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY AUTOINCREMENT, '
      '$_name TEXT, '
      '$_favorite INTEGER)';

  static const String _tableName = 'characters';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _favorite = 'favorite';

  Future<int> save(FavoriteCharacter favoriteCharacter) async {
    final Database db = await getDatabase();
    Map<String, dynamic> favoriteCharacterMap = toMap(favoriteCharacter);
    return db.insert(_tableName, favoriteCharacterMap);
  }

  Map<String, dynamic> toMap(FavoriteCharacter favoriteCharacter) {
    final Map<String, dynamic> favoriteCharacterMap = Map();
    favoriteCharacterMap[_name] = favoriteCharacter.name;
    favoriteCharacterMap[_favorite] = favoriteCharacter.favorite;
    return favoriteCharacterMap;
  }

  Future<List<FavoriteCharacter>> getFavoriteCharacters() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    List<FavoriteCharacter> favoriteCharacters = _toList(result);
    return favoriteCharacters;
  }

  List<FavoriteCharacter> _toList(List<Map<String, dynamic>> result) {
    final List<FavoriteCharacter> favoriteCharacters = [];
    for (Map<String, dynamic> row in result) {
      final FavoriteCharacter favoriteCharacter = FavoriteCharacter(
        row[_name],
        row[_favorite],
      );
      favoriteCharacters.add(favoriteCharacter);
    }
    return favoriteCharacters;
  }

  Future<void> delete(String name) async {
    final Database db = await getDatabase();
    await db.delete(
      _tableName,
      where: '$_name = ?',
      whereArgs: [name],
    );
  }
}
