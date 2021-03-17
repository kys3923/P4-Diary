import 'package:flutter/material.dart';
import 'package:flutter_diary/components/diary_page.dart';
import 'package:intl/intl.dart';

import 'package:flutter_diary/components/diary_card.dart';
import 'package:flutter_diary/components/diary_page.dart';



class Home2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    var titleTime = DateFormat.yMMMMd('en_US').format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[50],
        leading: IconButton(
          color: Colors.grey[400],
          icon: Icon(Icons.search),
          tooltip: 'search your diary',
          onPressed: () {
            print('Search button clicked');
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 20, 0),
            child: Text(
              '$titleTime',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 24.0,
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ScrollConfiguration(
                    behavior: NoGlowBehaviour(),
                    child: ListView(
                      children: [
                        DiaryCards(
                          title: "Get Started!",
                          desc: "Hello, Welcome to Flutter Diary app. \nClick/Touch Add button to write your diaries.",
                        ),
                        DiaryCards(),
                        DiaryCards(),
                        DiaryCards(),
                        DiaryCards(),
                        DiaryCards(),
                      ],
                    ),
                  ),
                ),

                //  MonthCard here

                //  add button here
              ],
            ),
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DiaryPage()
              ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.indigo,
      ),
    );
  }
}
