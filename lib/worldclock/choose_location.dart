import 'package:flutter/material.dart';


class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {


  //--------------------------------------------- commented out before http import, moved to loading.dart
  // void getData() async {
  //
  // //  simulate network request for a username
  //   String username = await Future.delayed(Duration(seconds: 3), () {
  //     return 'yoshi';
  //   });
  //
  //
  //   //  simulate network request to get bio of the username
  //   String bio = await Future.delayed(Duration(seconds: 2), () {
  //     return 'vegan, musician & egg collector';
  //   });
  //
  //
  //   print('$username - $bio'); // Async issue here, runs before yoshi.
  //
  // }
  //
  // int counter = 0;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   getData();
  //   print('hey there'); // ignores getData() of async
  // }

  @override
  Widget build(BuildContext context) {
    print('build initstate function ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: RaisedButton(
          onPressed: () {
            setState(() {
              // counter += 1;
            });
          },
          // child: Text('counter is $counter'),
      ),
    );
  }
}
