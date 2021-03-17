// --------------------------------------- importing dependencies
import 'package:flutter/material.dart';

// --------------------------------------- importing pages
// import 'pages/home.dart';
import 'pages/landing.dart';
// import 'pages/loading.dart';


void main() => runApp(MaterialApp(
  initialRoute: '/landing',
  routes:{
    // '/': (context) => Loading(),
    '/landing':(context) => Home2(),
  },
));