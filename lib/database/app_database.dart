import 'package:harry_challenge/database/character_dao.dart';
import 'package:harry_challenge/models/favorite_character.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'harrypotter.db');
      return openDatabase(path, onCreate: (db, version) {
        db.execute(CharacterDao.tableSql);
    }, version: 1,);
}
