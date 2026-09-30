import 'package:flutter/material.dart';

import 'package:flutter_application_1/MainScreen.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LOOMA',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.black,
        fontFamily: 'Roboto', 
      ),
      home:  MainScreen(),
    );
  }
}


