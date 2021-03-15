import 'package:flutter/material.dart';
import 'package:date_util/date_util.dart';
import 'package:intl/intl.dart';
import 'package:flip_card/flip_card.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var now = new DateTime.now();
  var dateUtility = new DateUtil();
  var titleTime = DateFormat.yMMMMd('en_US').format(DateTime.now());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
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
                color: Colors.grey[400],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
