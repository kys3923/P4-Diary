import 'package:path/path.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_diary/components/diary.dart';


class DatabaseHelper {

  Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'diary.db'),
      onCreate: (db, version) async {

        await  db.execute("CREATE TABLE diaries(id INTEGER PRIMARY KEY, title TEXT, description TEXT)");
        print('created');

        return db;
      },
      version: 1,
    );
  }

  Future<int> insertDiary(Diary diary) async {
    int diaryId = 0;
    Database _db = await database();
    await _db.insert('diaries', diary.toMap(), conflictAlgorithm: ConflictAlgorithm.replace).then((value) {
      diaryId = value;
    });
    return diaryId;
  }

  Future<void> updateDiaryTitle(int id, String title) async {
    Database _db = await database();
    await _db.rawUpdate("UPDATE diaries SET title = '$title' WHERE id = '$id'");
  }

  Future<void> updateDiaryDescription(int id, String description) async {
    Database _db = await database();
    await _db.rawUpdate("UPDATE diaries SET description = '$description' WHERE id = '$id'");
  }

  Future<List<Diary>> getDiaries() async {
    Database _db = await database();
    List<Map<String, dynamic>> diaryMap = await _db.query('diaries');
    return List.generate(diaryMap.length, (index) {
      return Diary(id: diaryMap[index]['id'], title: diaryMap[index]['title'], description: diaryMap[index]['description']);
    });
  }

  Future<void> deleteDiary(int id) async {
    Database _db = await database();
    await _db.rawDelete("DELETE FROM tasks WHERE id = '$id'");
  }

}