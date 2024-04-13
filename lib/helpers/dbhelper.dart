// ignore_for_file: unnecessary_null_comparison

import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:my_app/models/schedule.dart';

class DbHelper {
  static late DbHelper _dbHelper;
  static Database? _database;

  DbHelper._createObject();

  factory DbHelper() {
    if (_dbHelper == null) {
      _dbHelper = DbHelper._createObject();
    }
    return _dbHelper;
  }

  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'schedule.db';
    var todoDatabase = openDatabase(path, version: 1, onCreate: _createDb);
    return todoDatabase;
  }

  void _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE schedule (
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        name TEXT,
        keterangan TEXT,
        tanggal TEXT
      )
    ''');
    return;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initDb();
    }
    return _database!;
  }

  Future<List<Map<String, dynamic>>> select() async {
    Database db = await this.database;
    var mapList = await db.query('schedule', orderBy: 'tanggal');
    return mapList;
  }
  Future<int> insert(Schedule object) async {
    Database db = await this.database;
    int count = await db.insert('schedule', object.toMap());
    return count;
  }
  Future<int> update(Schedule object) async {
    Database db = await this.database;
    int count = await db.update('schedule', object.toMap(), where: 'id=?', whereArgs: [object.id]);
    return count;
  }
  Future<int> delete(int id) async {
    Database db = await this.database;
    int count = await db.delete('schedule', where: 'id=?', whereArgs: [id]);
    return count;
  }

  Future<List<Schedule>> getScheduleList() async {
    var scheduleMapList = await select();
    int count = scheduleMapList.length;
    List<Schedule> scheduleList = [];
    for (int i = 0; i < count; i++) {
      scheduleList.add(Schedule.fromMap(scheduleMapList[i]));
    }
    return scheduleList;
  }
}
