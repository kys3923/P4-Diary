// import 'package:flutter/material.dart';
// import 'package:date_util/date_util.dart';
// import 'package:flutter_diary/pages/database.dart';
// import 'package:flutter_diary/pages/edit_entry.dart';
// import 'package:intl/intl.dart';
// import 'dart:convert';
// import 'package:flip_card/flip_card.dart';
//
// // -------------------------------------------------- Home
// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//
//   Database _database;
//
//   var nowTime = new DateTime.now();
//   var dateUtility = new DateUtil();
//   var titleTime = DateFormat.yMMMMd('en_US').format(DateTime.now());
//
//   //-------------------------------------------- state of current date
//   String currentDate = '';
//
//
//
//   Widget _yearSelector() {
//     var datePlacing = int.parse(DateFormat('yyyy').format(nowTime));
//     var years = [
//       datePlacing -5,
//       datePlacing -4,
//       datePlacing -3,
//       datePlacing -2,
//       datePlacing -1,
//       datePlacing,
//       datePlacing +1,
//       datePlacing +2,
//       datePlacing +3,
//       datePlacing +4,
//       datePlacing +5,
//     ];
//     print(years);
//     return Text(
//       '$datePlacing',
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[50],
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.grey[50],
//         leading: IconButton(
//           color: Colors.grey[400],
//           icon: Icon(Icons.search),
//           tooltip: 'search your diary',
//           onPressed: () {
//             print('Search button clicked');
//           },
//         ),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.fromLTRB(0, 15, 20, 0),
//             child: Text(
//               '$titleTime',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.grey[700],
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: FutureBuilder(
//         initialData: [],
//         future: _loadDiaries(),
//         builder: (BuildContext context, AsyncSnapshot snapshot) {
//           return !snapshot.hasData
//               ? Center(child: CircularProgressIndicator())
//               : _buildListViewSeparated(snapshot);
//         },
//       ),
//       bottomNavigationBar: BottomAppBar(
//         shape: CircularNotchedRectangle(),
//         child: Padding(
//           padding: EdgeInsets.all(24.0),
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       floatingActionButton: FloatingActionButton(
//         tooltip: 'Add Diary',
//         child: Icon(Icons.add),
//         onPressed: () {
//           _addOrEditDiary(add: true, index: -1, diary: Diary());
//         },
//       ),
//     );
//   }
//
//   Future<List<Diary>> _loadDiaries() async {
//     await DatabaseFileRoutines().readDiaries().then((diaryList) {
//       _database = DatabaseFileRoutines().databaseFromJson(diaryList);
//     });
//     return _database.diary;
//   }
//
//   void _addOrEditDiary({bool add, int index, Diary diary}) async {
//     DiaryEdit _diaryEdit = DiaryEdit(action: 'Cancel', diary: diary);
//     _diaryEdit = await Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) =>
//             EditEntry(add: add, index: index, _diaryEdit: _diaryEdit),
//         fullscreenDialog: true,
//       ),
//     );
//     switch(_diaryEdit.action) {
//       case 'Save' :
//         if(add)  {
//           setState(() {
//             _database.diary.add(_diaryEdit.diary);
//           });
//         }else{
//           setState(() {
//             _database.diary[index] =_diaryEdit.diary;
//           });
//         }
//         DatabaseFileRoutines().writeDiaries(DatabaseFileRoutines().dataToJson(_database));
//         break;
//
//       case 'Cancel' :
//         break;
//
//       default :
//         break;
//     }
//   }
//
//   Widget _buildListViewSeparated(AsyncSnapshot snapshot) {
//     return ListView.separated(
//       itemBuilder: (BuildContext context, int index) {
//         String _titleDate = DateFormat.yMMMEd().format(DateTime.parse(snapshot.data[index].date));
//         String _subtitle = snapshot.data[index].mood + "\n" + snapshot.data[index].weather + "\n" + snapshot.data[index].note;
//         return Dismissible(
//             key: Key(snapshot.data[index].id),
//             background: Container(
//               color: Colors.red,
//               alignment: Alignment.centerLeft,
//               padding: EdgeInsets.only(left: 16),
//               child: Icon(Icons.delete, color: Colors.white),
//             ),
//             secondaryBackground: Container(
//                 color: Colors.red,
//                 alignment: Alignment.centerRight,
//                 padding: EdgeInsets.only(left: 16),
//                 child: Icon(Icons.delete, color: Colors.white),
//               ),
//             child: ListTile(
//               leading: Column(children: <Widget>[
//                 Text(
//                     DateFormat.d().format(
//                       DateTime.parse(snapshot.data[index].date)),
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 32,
//                           color: Colors.blue,
//                       ),
//                 ),
//                 Text(
//                   DateFormat.E().format(
//                     DateTime.parse(snapshot.data[index].date)
//                   ),
//                 ),
//               ],
//               ),
//               title: Text(
//                 _titleDate, style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               subtitle: Text(_subtitle),
//               onTap: () {
//                 _addOrEditDiary(add: false, index: index, diary: snapshot.data[index]);
//               }
//             ),
//           onDismissed: (direction) {
//               setState(() {
//                 _database.diary.removeAt(index);
//               });
//               DatabaseFileRoutines().writeDiaries(DatabaseFileRoutines().dataToJson(_database));
//           },
//           );
//       },
//       separatorBuilder: (BuildContext context, int index) {
//         return Divider(color: Colors.grey);
//       }
//     );
//   }
// }
