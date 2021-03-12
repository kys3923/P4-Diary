import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Home()
));

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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('hello, world'),
            FlatButton(
                onPressed: () {},
                color: Colors.amber,
                child: Text('click here')
            ),
            Container(
              color: Colors.cyan,
              padding: EdgeInsets.all(30),
              child: Text('inside container')
            )
          ]
        ),


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