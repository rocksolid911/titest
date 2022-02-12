import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:titest/LocalDatabase/Model/movie_model.dart';
import 'package:titest/LocalDatabase/Model/user_model.dart';

String db_name = "ticket_booking.db";

class DatabaseHelper {
  Future<Database> initDatabase() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, db_name),
      onCreate: (database, version) async {
        await database.execute("""
        CREATE TABLE User(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        email TEXT ,
        password TEXT ,
        name TEXT ,
        phone INTEGER 
       
        )
        """);
        await database.execute("""
        CREATE TABLE Movie(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        movie_name TEXT ,
        ticket_quantity INTEGER ,
        time TEXT ,
        price INTEGER 
       
        )
        """);
      },
      version: 1,
    );
  }

  //user code
  Future<int> createUser(UserModel userModel) async {
    final Database db = await initDatabase();
    int result = await db.insert("User", userModel.toMap());
    return result;
  }

  Future<List<UserModel>> getUser() async {
    final Database db = await initDatabase();
    final List<Map<String, Object?>> datas = await db.query("User");
    return datas.map((e) => UserModel.fromMap(e)).toList();
  }

  Future<void> updateUser(UserModel userModel, int id) async {
    final Database db = await initDatabase();
    await db.update("User", userModel.toMap(), where: "id=?", whereArgs: [id]);
  }

  Future<void> deleteUser(int id) async {
    final Database db = await initDatabase();
    await db.delete("User", where: "id=?", whereArgs: [id]);
  }

  //movie code

  Future<int> insertMovie(MovieModel movieModel) async {
    final Database db = await initDatabase();
    int result = await db.insert("Movie", movieModel.toMap());
    return result;
  }

  Future<List<MovieModel>> getMovie() async {
    final Database db = await initDatabase();
    final List<Map<String, Object?>> datas = await db.query("Movie");
    return datas.map((e) => MovieModel.fromMap(e)).toList();
  }

  Future<void> updateMovie(MovieModel movieModel, int id) async {
    final Database db = await initDatabase();
    await db.update("User", movieModel.toMap(), where: "id=?", whereArgs: [id]);
  }

  Future<void> deleteMovie(int id) async {
    final Database db = await initDatabase();
    await db.delete("Movie", where: "id=?", whereArgs: [id]);
  }
}
