// import 'package:flutter/material.dart';
// import 'package:flutter_diary/pages/database.dart';
// import 'package:intl/intl.dart';
//
// class EditEntry extends StatefulWidget {
//
//   const EditEntry(Key key, this.add, this.index, this.diaryEdit) :
//         super(key: key);
//
//   final bool add;
//   final int index;
//   final DiaryEdit diaryEdit;
//
//   @override
//   _EditEntryState createState() => _EditEntryState();
// }
//
// class _EditEntryState extends State<EditEntry> {
//
//   DiaryEdit _diaryEdit;
//   String _title;
//   DateTime _selectedDate;
//
//   TextEditingController _moodController = TextEditingController();
//   TextEditingController _noteController = TextEditingController();
//   TextEditingController _weatherController = TextEditingController();
//
//   FocusNode _moodFocus = FocusNode();
//   FocusNode _noteFocus = FocusNode();
//   FocusNode _weatherFocus = FocusNode();
//
//   @override
//   void initState() {
//     super.initState();
//     _diaryEdit = DiaryEdit(
//       action: 'Cancel',
//       diary: widget.diaryEdit.diary
//     );
//
//     _title = widget.add ? 'Add' : 'Edit' ;
//     _diaryEdit.diary = widget.diaryEdit.diary;
//
//     if (widget.add) {
//       _selectedDate = DateTime.now();
//       _moodController.text = '';
//       _noteController.text = '';
//       _weatherController.text = '';
//     }else{
//       _selectedDate = DateTime.parse(_diaryEdit.diary.date);
//       _moodController.text = _diaryEdit.diary.mood;
//       _noteController.text = _diaryEdit.diary.note;
//       _weatherController.text = _diaryEdit.diary.weather;
//     }
//   }
//
//   @override
//   void dispose() {
//     _moodController.dispose();
//     _noteController.dispose();
//     _weatherController.dispose();
//     _moodFocus.dispose();
//     _noteFocus.dispose();
//     _weatherFocus.dispose();
//     super.dispose();
//   }
//
//   Future<DateTime> _selectDate(DateTime selectedDate) async {
//     DateTime _initialDate = selectedDate;
//     final DateTime _pickedDate = await showDatePicker(
//       context: context,
//       initialDate: _initialDate,
//       firstDate: DateTime.now().subtract(Duration(days: 365)),
//       lastDate: DateTime.now().add(Duration(days: 365)),
//     );
//
//     if(_pickedDate != null) {
//       selectedDate = DateTime(
//         _pickedDate.year,
//         _pickedDate.month,
//         _pickedDate.day,
//         _pickedDate.hour,
//         _pickedDate.minute,
//         _pickedDate.second,
//         _pickedDate.millisecond,
//         _pickedDate.microsecond,
//       );
//     }
//
//     return selectedDate;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(_title),
//         automaticallyImplyLeading: false,
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             children: <Widget>[
//               FlatButton(
//                 padding: EdgeInsets.all(0),
//                 child: Row(
//                   children: <Widget>[
//                     Icon(Icons.calendar_today, size: 22.0, color: Colors.black54),
//                     SizedBox(width: 16.0,),
//                     Text(
//                       DateFormat.yMMMEd().format(_selectedDate),
//                       style: TextStyle(
//                         color: Colors.black54,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Icon(
//                       Icons.arrow_drop_down,
//                       color: Colors.black54,
//                     ),
//                   ],
//                 ),
//                 onPressed: () async {
//                   FocusScope.of(context).requestFocus(FocusNode());
//
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
