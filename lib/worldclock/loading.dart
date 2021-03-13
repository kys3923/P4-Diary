import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getTime() async {

    Response response = await get(Uri.parse('https://worldtimeapi.org/api/timezone/America/New_York'));
    Map data = jsonDecode(response.body);
    // print(data);

  //  get properties from data
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);
    // print(datetime);
    // print(offset);

  //  Create datetime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    print(now);

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

  }

  int counter = 0;

  @override
  void initState() {
    super.initState();
    getTime();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('loading screen')
    );
  }
}
