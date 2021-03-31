import 'package:flutter/material.dart';
import 'package:bookmycourse/views/home.dart';
import 'package:flutter/services.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BookMyCourse',
      theme: ThemeData(
        accentColor: Colors.redAccent,
        primaryColor: Colors.white,
      ),
      home: Home(),
    );
  }
}


