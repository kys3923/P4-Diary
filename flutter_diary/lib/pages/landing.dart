import 'package:flutter/material.dart';
import 'package:flutter_diary/components/database_helper.dart';
import 'package:flutter_diary/components/diary_page.dart';
import 'package:intl/intl.dart';
import 'package:flutter_diary/components/diary_card.dart';



class Home2 extends StatefulWidget {

  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {

  DatabaseHelper _dbHelper = DatabaseHelper();

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
                DiaryCards(
                  title: 'Welcome to the Diary',
                  desc: 'Press + Icon to write diaries',
                ),
                DiaryCards(
                  title: 'Dummy Title1',
                  desc: 'Flutter is hard to learn. Had to rewrite codes 3 times already.',
                ), DiaryCards(
                  title: 'Dummy Title2',
                  desc: 'Why this DB is not writing?????? So annoying!!',
                ),

                Expanded(
                  child: FutureBuilder(
                    initialData: [],
                    future: _dbHelper.getDiaries(),
                    builder: (context, snapshot) {
                      return ScrollConfiguration(
                        behavior: NoGlowBehaviour(),
                        child: ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DiaryPage(
                                        diary: snapshot.data[index],
                                      ),
                                  ),
                                ).then(
                                    (value) {
                                      setState(() {

                                      });
                                    }
                                );
                              },
                              child: DiaryCards(
                                title: snapshot.data[index].title,
                                desc: snapshot.data[index].description,
                              ),
                            );
                          },
                        ),
                      );
                    },
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
                builder: (context) => DiaryPage(
                  diary: null,
                )
              ),
          ).then((value) {
            setState(() {

            });
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.indigo,
      ),
    );
  }
}
