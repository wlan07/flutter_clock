import 'package:flutter_clock/data/models/Alarm.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

const String tableAlarm = 'Alarm';
const String columnId = 'alarmId';
const String columnName = 'alarmName';
const String columnHour = 'hour';
const String columnActive = 'active';
const String columnIsAm = 'am';
const String columnMinute = "minute";
const String columnDays = "days";
const String columnsoundName = "soundName";
const String columnsoundVolume = "soundVolume";
const String columnVibrate = "vibrate";

class AlarmHelper {
  static Database _database;
  static AlarmHelper _alarmHelper;

  AlarmHelper._createInstance();
  factory AlarmHelper() {
    if (_alarmHelper == null) {
      _alarmHelper = AlarmHelper._createInstance();
    }
    return _alarmHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    
    var dir = await getDatabasesPath();
    var path = dir + "alarm.db";

    var database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async{
        await db.execute("""
          create table $tableAlarm ( 
          $columnId integer primary key autoincrement, 
          $columnName text not null,
          $columnDays text not null,
          $columnHour integer,
          $columnMinute integer,
          $columnIsAm integer,
          $columnVibrate integer,
          $columnsoundName text not null,
          $columnsoundVolume num,
          $columnActive integer
          )
        """);
      },
    );
    return database;
  }

  Future<void> insertAlarm(AlarmInfo alarmInfo) async {
    var db = await this.database;
    var result = await db.insert(tableAlarm, alarmInfo.toMap(alarmInfo));
    print('result : $result');
  }

  Future<List<AlarmInfo>> getAlarms() async {
    List<AlarmInfo> _alarms = [];

    var db = await this.database;
    var result = await db.query(tableAlarm);
    result.forEach((element) {
      var alarmInfo = AlarmInfo.fromMap(element);
      _alarms.add(alarmInfo);
    });

    return _alarms;
  }

  Future<int> delete(int id) async {
    var db = await this.database;
    return await db.delete(tableAlarm, where: '$columnId = ?', whereArgs: [id]);
  }
}
