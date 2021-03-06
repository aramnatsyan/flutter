import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'app_screens/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
    );
  }
}
