import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter_diary/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  // void getTime() async {
  //
  //   Response response = await get(Uri.parse('https://worldtimeapi.org/api/timezone/America/New_York'));
  //   Map data = jsonDecode(response.body);
  //   // print(data);
  //
  // //  get properties from data
  //   String datetime = data['datetime'];
  //   String offset = data['utc_offset'].substring(1,3);
  //   // print(datetime);
  //   // print(offset);
  //
  // //  Create datetime object
  //   DateTime now = DateTime.parse(datetime);
  //   now = now.add(Duration(hours: int.parse(offset)));
  //   print(now);

  // ------------------------------------------- commented out before getting time API
  // void getData() async {
  //
  //   Response response = await get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1')); //gets as a string
  //   Map data = jsonDecode(response.body); //converting string to map data
  //   print(data);
  //   print(data['title']);

    // //  simulate network request for a username
    // String username = await Future.delayed(Duration(seconds: 3), () {
    //   return 'yoshi';
    // });
    //
    //
    // //  simulate network request to get bio of the username
    // String bio = await Future.delayed(Duration(seconds: 2), () {
    //   return 'vegan, musician & egg collector';
    // });
    //
    //
    // print('$username - $bio'); // Async issue here, runs before yoshi.

  // }

  int counter = 0;

  // String time = 'loading';

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'New_York', flag: 'america.png', url: 'America/New_York');
    await instance.getTime();
    Navigator.pushNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    }); //routing after loading, with data
    // print(instance.time);
    // setState(() {
    //   time = instance.time;
    // });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
    // getTime();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 80,
        ),
      ),


      // commented out before installing the spinner
      // body: Padding(
      //   padding: EdgeInsets.all(50),
      //   child: Text('loading'),
      // ),
    );
  }
}
