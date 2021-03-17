import 'dart:io';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseFileRoutines {

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async{
    final path = await _localPath;

    return File('$path/local_persistence.json');
  }

  Future<String> readDiaries() async {
    try{
      final file = await _localFile;
      if(!file.existsSync()) {
        print('File is not available: ${file.absolute}');
        await writeDiaries('{"diaries": []}');
      }
      String contents = await file.readAsString();
      return contents;
    }catch(e) {
      print('error reading Diaries: $e');
      return '';
    }
  }

  //to save the JSON object to file
  Future<File> writeDiaries(String json) async {
    final file = await _localFile;

    return file.writeAsString('$json');
  }

  // handle JSON decode and encode for the entire database
  // To read and parse data from JSON
  Database databaseFromJson(String str) {
    final dataFromJson = json.decode(str);

    return Database.fromJson(dataFromJson);
  }

  String dataToJson(Database data){
    final dataToJson = data.toJson();

    return json.encode(dataToJson);
  }


}

//------------------------- Database class
class Database {
  List<Diary> diary;

  Database({this.diary});

  factory Database.fromJson(Map<String, dynamic> json) => Database(
      diary: List<Diary>.from(
          json['diaries'].map((x) => Diary.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    'diaries': List<dynamic>.from(diary.map((x) => x.toJson())),
  };
}

//--------------------------- Diary Class
class Diary {
  String id, date, mood, weather, note;

  Diary({this.id, this.date, this.mood, this.note, this.weather});

  factory Diary.fromJson(Map<String, dynamic> json) => Diary(
    id: json["id"],
    date: json["date"],
    mood: json["mood"],
    note: json["note"],
    weather: json["weather"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": date,
    "mood": mood,
    "note": note,
    "weather": weather,
  };
}

class DiaryEdit {
  String action;
  Diary diary;

  DiaryEdit({this.action, this.diary});
}