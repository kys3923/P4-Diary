// --------------------------------------- importing dependencies
import 'package:flutter/material.dart';

// --------------------------------------- importing pages
import 'pages/home.dart';
import 'pages/loading.dart';


void main() => runApp(MaterialApp(
  initialRoute: '/home',
  routes:{
    // '/': (context) => Loading(),
    '/home':(context) => Home(),
  },
));