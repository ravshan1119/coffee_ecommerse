import 'package:coffee_ecommerse/data/model/client_order_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  static final LocalDatabase getInstance = LocalDatabase._init();

  LocalDatabase._init();

  factory LocalDatabase() {
    return getInstance;
  }

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDB("ombor.db");
      return _database!;
    }
  }

  Future<Database> _initDB(String dbName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const textType = "TEXT NOT NULL";
    const intType = "INTEGER DEFAULT 0";

    await db.execute('''
    CREATE TABLE ${EventModelFields.omborTable} (
    ${EventModelFields.id} $idType,
    ${EventModelFields.productName} $textType,
    ${EventModelFields.count} $textType,
    ${EventModelFields.firebaseId} $textType
    )
    ''');

    debugPrint("-------DB----------CREATED---------");
  }

  static Future<ClientOrderModel> insertTodo(ClientOrderModel eventModel) async {
    final db = await getInstance.database;
    final int id =
    await db.insert(EventModelFields.omborTable, eventModel.toJson());
    print("ID:  $id");
    eventModel.id = id;
    return eventModel.copyWith(id: id);
  }

  static Future<List<ClientOrderModel>> getAllTodos() async {
    List<ClientOrderModel> allToDos = [];
    final db = await getInstance.database;
    allToDos = (await db.query(EventModelFields.omborTable))
        .map((e) => ClientOrderModel.fromJson(e))
        .toList();

    return allToDos;
  }

  static updateTodo({required ClientOrderModel eventModel}) async {
    final db = await getInstance.database;
    db.update(
      EventModelFields.omborTable,
      eventModel.toJson(),
      where: "${EventModelFields.id} = ?",
      whereArgs: [eventModel.id],
    );
  }

  static Future<int> deleteTodo(int id) async {
    final db = await getInstance.database;
    int count = await db.delete(
      EventModelFields.omborTable,
      where: "${EventModelFields.id} = ?",
      whereArgs: [id],
    );
    return count;
  }

  static Future<ClientOrderModel?> getSingleProduct(String barCode) async {
    List<ClientOrderModel> contacts = [];
    final db = await getInstance.database;
    contacts = (await db.query(
      EventModelFields.omborTable,
      where: "${EventModelFields.barCode} = ?",
      whereArgs: [barCode],
    ))
        .map((e) => ClientOrderModel.fromJson(e))
        .toList();

    if (contacts.isNotEmpty) {
      return contacts.first;
    }
    return null;
  }
}
