import 'package:flutter/material.dart';
import 'package:flutter_diary/components/database_helper.dart';
import 'database_helper.dart';
import 'diary.dart';

class DiaryPage extends StatefulWidget {
  final Diary diary;

  DiaryPage({@required this.diary});

  @override
  _DiaryPageState createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  DatabaseHelper _dbHelper = DatabaseHelper();

  int _diaryId = 0;
  String _diaryTitle = '';
  String _diaryDescription = '';

  FocusNode _titleFocus;
  FocusNode _descriptionFocus;

  @override
  void initState() {
    if (widget.diary != null) {
      _diaryTitle = widget.diary.title;
      _diaryDescription = widget.diary.description;
      _diaryId = widget.diary.id;
    }

    _titleFocus = FocusNode();
    _descriptionFocus = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    _titleFocus.dispose();
    _descriptionFocus.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 24.0,
                  bottom: 6.0,
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Icon(Icons.arrow_back),
                      ),
                    ),
                    Expanded(
                        child: TextField(
                          focusNode: _titleFocus,
                          onSubmitted: (value) async  {
                            print('entered title: $value');

                            if(value != '') {
                              if (widget.diary == null) {
                                Diary _newDiary = Diary(title: value);
                                _diaryId = await _dbHelper.insertDiary(_newDiary);
                                print('date inputted');
                                setState(() {
                                  _diaryTitle = value;
                                });
                              } else {
                                await _dbHelper.updateDiaryTitle(_diaryId, value);
                                print('Diary updated');
                              }
                              _descriptionFocus.requestFocus();
                            }
                          },
                          controller: TextEditingController()
                            ..text = _diaryTitle,
                          decoration: InputDecoration(
                            hintText: 'Enter Diary Title',
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontSize: 26.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo,
                          ),
                        ),
                    ),
                  ],
                ),
              ),
              //TODO: Add mood and weather input here
              TextField(
                focusNode: _descriptionFocus,
                onSubmitted: (value) async {
                  if(value != '') {
                    if(_diaryId != 0){
                      await _dbHelper.updateDiaryDescription(_diaryId, value);
                      _diaryDescription = value;
                    }
                  }
                  print('field Value: $value');
                },
                controller: TextEditingController()..text = _diaryDescription,
                decoration: InputDecoration(
                  hintText: 'Enter Description for the diary',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 24.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      //  TODO: add a button?
      ),
    );
  }
}
