import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: NinjaCard(),
));

class NinjaCard extends StatefulWidget {
  @override
  _NinjaCardState createState() => _NinjaCardState();
}

class _NinjaCardState extends State<NinjaCard> {

  int ninjaLevel = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Some ID Card'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            ninjaLevel += 1;
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.grey[800],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Column (
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage('https://placekitten.com/200/300'),
                radius: 40,
              ),
            ),
            Divider(
              height: 60, //not the thickness of the line
              color: Colors.grey[800],
            ),
            Text(
              'NAME',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 1,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Some Name',
              style: TextStyle(
                color: Colors.amberAccent[200],
                letterSpacing: 1,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            Text(
              'CURRENT LEVEL',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 1,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '$ninjaLevel', // variable
              style: TextStyle(
                color: Colors.amberAccent[200],
                letterSpacing: 1,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            Row(
              children: <Widget>[
                Icon(
                  Icons.email,
                  color: Colors.grey[400],
                ),
                SizedBox(width: 10),
                Text(
                  'somename@somthing.com',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 18,
                    letterSpacing: 1,
                  ),
                ),
              ]
            ),
          ],
        ),
      ),
    );
  }
}




class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('my first app'),
        centerTitle: true,
        backgroundColor: Colors.amber[600],
        ),
        body: Row(
          children: <Widget>[
            Expanded( //functions lika a group
              flex: 3, //portion of the width
              child: Container(
                padding: EdgeInsets.all(30),
                color: Colors.cyan,
                child: Text('1'),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(30),
                color: Colors.pinkAccent,
                child: Text('2'),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(30),
                color: Colors.amber,
                child: Text('3'),
              ),
            ),

          ],
        ),


        //------------------------------- column expanded
        // body: Column(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   crossAxisAlignment: CrossAxisAlignment.end,
        //   children: <Widget>[
        //     Row(
        //       children: <Widget>[
        //         Text('hello'),
        //         Text('world'),
        //       ]
        //     ),
        //     Container(
        //       padding: EdgeInsets.all(20),
        //       color: Colors.cyan,
        //       child: Text('one')
        //     ),
        //     Container(
        //         padding: EdgeInsets.all(30),
        //         color: Colors.pinkAccent,
        //         child: Text('two')
        //     ),
        //     Container(
        //         padding: EdgeInsets.all(40),
        //         color: Colors.amber,
        //         child: Text('three')
        //     ),
        //   ],
        // ),


        //----------------------------------- Row
        // body: Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: <Widget>[
        //     Text('hello, world'),
        //     FlatButton(
        //         onPressed: () {},
        //         color: Colors.amber,
        //         child: Text('click here')
        //     ),
        //     Container(
        //       color: Colors.cyan,
        //       padding: EdgeInsets.all(30),
        //       child: Text('inside container')
        //     )
        //   ]
        // ),


        //------------------------------ having padding itself as an element
        // body: Padding(
        //   padding: EdgeInsets.all(30),
        //   child: Text('hello2')

      //-------------------------------- using container and padding
      // body: Container(
      //   padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      //   margin: EdgeInsets.all(30.0),
      //   color: Colors.grey[400],
      //   child: Text('Hello')

        //----------------------------- press button
        // child: IconButton(
        //   onPressed: () {
        //     print('Clicked Icon');
        //   },
        //   icon: Icon(Icons.alternate_email),
        //   color: Colors.amber


        //------------------------------ icon button
        // child: FlatButton.icon(
        //     onPressed: () {},
        //     icon: Icon(
        //       Icons.mail
        //     ),
        //     label: Text('mail'),
        //     color: Colors.amber,

        //------------------------------ Button
        // child: RaisedButton(
        //   onPressed: () {
        //     print('clicked me');
        //   },
        //   child: Text('click'),
        //   color: Colors.blue,

        //------------------------------ placing icons
        // child: Icon(
        //   Icons.airport_shuttle,
        //   color: Colors.purple,
        //   size: 50.0


        // Image(

        // child: Image.asset('assets/IMG_1302.JPG')
          // image: AssetImage('assets/IMG_1302.JPG'),

        // ------------------------------- Placing Image web
        //   image: NetworkImage('https://placekitten.com/200/300')
        // child: Image.network('https://placekitten.com/200/300')


        //-------------------------------- Placing text
        // child: Text(
        //     'Hello',
        //     style: TextStyle(
        //       fontSize: 20.0,
        //       fontWeight: FontWeight.bold,
        //       letterSpacing: 2.0,
        //       color: Colors.grey[600],
        //       fontFamily: 'NanumGothic-Bold',
        //     )


      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text(
            'click'
        ),
        backgroundColor: Colors.amber[600],
      ),
    );
  }
}
