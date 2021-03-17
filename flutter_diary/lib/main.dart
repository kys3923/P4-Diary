// --------------------------------------- importing dependencies
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// --------------------------------------- importing pages
// import 'pages/home.dart';
import 'pages/landing.dart';
// import 'pages/loading.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Diary',
      theme: ThemeData(
        textTheme: GoogleFonts.nanumGothicTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      initialRoute: '/landing',
      routes: {
    // '/': (context) => Loading(),
        '/landing':(context) => Home2(),
      },
    );
  }
}




// void main() => runApp(MaterialApp(
//   debugShowCheckedModeBanner: false,
//   theme: ThemeData(
//     textTheme: GoogleFonts.nanumGothicCodingTextTheme(
//       Theme.of(context).textTheme,
//     ),
//   ),
//   initialRoute: '/landing',
//   routes:{
//     // '/': (context) => Loading(),
//     '/landing':(context) => Home2(),
//   },
// ));