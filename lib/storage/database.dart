import 'dart:async';

import 'package:life_style_hub/helpers/helper.dart';
import 'package:life_style_hub/model/model.dart';
import 'package:life_style_hub/utils/constants.dart';

class DatabaseManager {
  static final DatabaseManager _instance = new DatabaseManager.internal();

  factory DatabaseManager() => _instance;

  final String databaseName = "lifestylehub.db";

  final String TABLE_REFLECTION = "reflections";

  final String TABLE_CART = "cart";
  final String TABLE_ORDER = "orders";
  final String TABLE_REQUESTED = "requested";
  final String TABLE_REQUESTS = "requests";
  final String TABLE_TODO = "todo";
  final String TABLE_REMINDER = "reminder";
  final String TABLE_USERS = "users";

  //final String TABLE_LANGUAGE = "";

  static Database _db;

  DatabaseManager.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, databaseName);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    String CREATE_REMINDER_TABLE = "CREATE TABLE " +
        TABLE_REMINDER +
        "(" +
        KEY_ID +
        " INTEGER PRIMARY KEY," +
        KEY_TITLE +
        " TEXT," +
        KEY_DESCRIPTION +
        " TEXT," +
        KEY_DATE +
        " TEXT," +
        KEY_ALARM_DATE +
        " TEXT," +
        KEY_ALARM_TIME +
        " TEXT, " +
        KEY_DONE +
        ", INTEGER)";

    String CREATE_TODO_TABLE = "CREATE TABLE " +
        TABLE_TODO +
        "(" +
        KEY_ID +
        " INTEGER PRIMARY KEY," +
        KEY_TITLE +
        " TEXT," +
        KEY_DESCRIPTION +
        " TEXT," +
        KEY_DATE +
        " TEXT," +
        KEY_CATEGORY +
        " TEXT" +
        KEY_PRIORITY +
        " INTEGER )";

    String CREATE_REFLECTION_TABLE = "CREATE TABLE " +
        TABLE_REFLECTION +
        "(" +
        KEY_ID +
        " INTEGER NOT NULL," +
        KEY_TITLE +
        " TEXT," +
        KEY_CONTENT +
        " TEXT," +
        KEY_AUTHOR +
        " TEXT," +
        KEY_IMAGE_LINK +
        " TEXT, " +
        KEY_AUDIO_LINK +
        " TEXT, " +
        KEY_CREATED_AT +
        " TEXT" +
        ")";
    String CREATE_USERS_TABLE = "CREATE TABLE " +
        TABLE_USERS +
        "(" +
        KEY_ID +
        " INTEGER NOT NULL," +
        KEY_FIRST_NAME +
        " TEXT," +
        KEY_LAST_NAME +
        " TEXT," +
        KEY_EMAIL +
        " TEXT," +
        KEY_PASSWORD +
        " TEXT, " +
        ")";

    await db.execute(CREATE_REFLECTION_TABLE);
    await db.execute(CREATE_TODO_TABLE);
    await db.execute(CREATE_REMINDER_TABLE);
    await db.execute(CREATE_USERS_TABLE);
  }

  Future<bool> isReflection(Reflection reflection) async {
    var dbClient = await db;
    var count = Sqflite.firstIntValue(await dbClient.rawQuery(
        "SELECT COUNT(*) FROM $TABLE_REFLECTION WHERE $KEY_ID = ?",
        [reflection.id]));
    if (count == 0) {
      return false;
    } else {
      return true;
    }
  }

  Future<bool> isTodo(Task task) async {
    var dbClient = await db;
    var count = Sqflite.firstIntValue(await dbClient.rawQuery(
        "SELECT COUNT(*) FROM $TABLE_TODO WHERE $KEY_ID = ?", [task.id]));
    if (count == 0) {
      return false;
    } else {
      return true;
    }
  }

  Future<bool> isTodoExist(Task task) async {
    var dbClient = await db;
    var count = Sqflite.firstIntValue(await dbClient.rawQuery(
        "SELECT * FROM $TABLE_TODO WHERE $KEY_TITLE = ? AND $KEY_DATE = ? ",
        [task.title, task.date]));
    if (count == 0) {
      return false;
    } else {
      return true;
    }
  }

  Future<bool> isReminder(Task task) async {
    var dbClient = await db;
    var count = Sqflite.firstIntValue(await dbClient.rawQuery(
        "SELECT COUNT(*) FROM $TABLE_REMINDER WHERE $KEY_ID = ?", [task.id]));
    if (count == 0) {
      return false;
    } else {
      return true;
    }
  }

  //handles both add and update
  Future<int> manageReflection(Reflection reflection) async {
    //print("id: ${reflection.id}");
    var dbClient = await db;
    var count = Sqflite.firstIntValue(await dbClient.rawQuery(
        "SELECT COUNT(*) FROM $TABLE_REFLECTION WHERE $KEY_ID = ?",
        [reflection.id]));
    if (count == 0) {
      return await dbClient.insert(TABLE_REFLECTION, reflection.toJson());
    } else {
      return await dbClient.update(TABLE_REFLECTION, reflection.toJson(),
          where: "$KEY_ID = ?", whereArgs: [reflection.id]);
    }
  }

  Future<int> manageTodo(Task task) async {
    //print("id: ${reflection.id}");
    var dbClient = await db;
    var count = Sqflite.firstIntValue(await dbClient.rawQuery(
        "SELECT COUNT(*) FROM $TABLE_TODO WHERE $KEY_ID = ?", [task.id]));
    if (count == 0) {
      return await dbClient.insert(TABLE_TODO, task.toJson());
    } else {
      return await dbClient.update(TABLE_TODO, task.toJson(),
          where: "$KEY_ID = ?", whereArgs: [task.id]);
    }
  }

  Future<int> manageReminder(Task task) async {
    //print("id: ${reflection.id}");
    var dbClient = await db;
    var count = Sqflite.firstIntValue(await dbClient.rawQuery(
        "SELECT COUNT(*) FROM $TABLE_REMINDER WHERE $KEY_ID = ?", [task.id]));
    if (count == 0) {
      return await dbClient.insert(TABLE_REMINDER, task.toReminder());
    } else {
      return await dbClient.update(TABLE_REMINDER, task.toReminder(),
          where: "$KEY_ID = ?", whereArgs: [task.id]);
    }
  }

  Future<List<Reflection>> getReflectionList() async {
    var dbClient = await db;
    String sql;
    sql = "SELECT * FROM $TABLE_REFLECTION";
    var result = await dbClient.rawQuery(sql);
    if (result.length == 0) return new List<Reflection>();
    List<Reflection> list = result.map((item) {
      return Reflection.fromJson(item);
    }).toList();
    //Collections.
    return list.reversed.toList();
  }

  Future<List<Task>> getTodoList() async {
    var dbClient = await db;
    String sql;
    sql = "SELECT * FROM $TABLE_TODO";
    var result = await dbClient.rawQuery(sql);
    if (result.length == 0) return new List<Task>();
    List<Task> list = result.map((item) {
      return Task.fromJson(item);
    }).toList();
    //Collections.
    return list.reversed.toList();
  }

  Future<List<Task>> getTodoListByPriority() async {
    var dbClient = await db;
    String sql;
    sql = "SELECT * FROM $TABLE_TODO ORDER BY $KEY_PRIORITY ASC";
    var result = await dbClient.rawQuery(sql);
    if (result.length == 0) return new List<Task>();
    List<Task> list = result.map((item) {
      return Task.fromJson(item);
    }).toList();
    //Collections.
    return list.reversed.toList();
  }

  Future<List<Task>> getReminderList() async {
    var dbClient = await db;
    String sql;
    sql = "SELECT * FROM $TABLE_REMINDER";
    var result = await dbClient.rawQuery(sql);
    if (result.length == 0) return new List<Task>();
    List<Task> list = result.map((item) {
      return Task.fromJson(item);
    }).toList();
    //Collections.
    return list.reversed.toList();
  }

  Future<int> deleteTodo(Task task) async {
    var dbClient = await db;
    return await dbClient
        .delete(TABLE_TODO, where: '$KEY_ID = ?', whereArgs: [task.id]);
  }

  Future<int> deleteReminder(Task task) async {
    var dbClient = await db;
    return await dbClient
        .delete(TABLE_REMINDER, where: '$KEY_ID = ?', whereArgs: [task.id]);
  }
  Future<int>registerUser(User user)async{
    var dbClient = await db;
    return  dbClient.insert(TABLE_USERS, user.toJson());
  }

//
//  Future<User>loginUser(String email, String password) async{
//    var dbClient = await db;
//    dbClient.query(TABLE_USERS,)
//  }
  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
