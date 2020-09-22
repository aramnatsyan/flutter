import 'package:flutter/material.dart';
import 'app_screens/login.dart';
import 'app_screens/registerVerifyCode.dart';

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
