import 'package:flutter/material.dart';

class DiaryPage extends StatefulWidget {
  @override
  _DiaryPageState createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
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
      ),
    );
  }
}
