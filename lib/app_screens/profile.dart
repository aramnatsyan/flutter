// import 'dart:io';
// import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'user_page_header_footer/user_profile_header.dart';
import 'navigation/profile_bottom_navigation_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter/services.dart';

// ignore: must_be_immutable
class UserProfile extends StatefulWidget {
  Map userData;
  UserProfile({Key key, this.userData}) : super(key: key);
  @override
  State createState() => new UserProfileState(userData);
}

class UserProfileState extends State<UserProfile> {
  Map userData;
  /* 
  profile rources
  */
  String payTypes = '';
  String emailInputtext = '';

  UserProfileState(this.userData);

  @override
  void initState() {
    getProfileResources();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ListView(
        children: <Widget>[
          ProfileHeader(
            userData: userData,
          ),
          Container(
            margin: const EdgeInsets.only(left: 10.0, right: 10.0),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
            ),
            child: FlatButton(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  payTypes,
                  style: TextStyle(fontSize: 18.0, height: 3.0),
                ),
              ),
              onPressed: () {
                print(payTypes);
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10.0, right: 10.0),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
            ),
            child: FlatButton(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  'Рейтинг',
                  style: TextStyle(fontSize: 18.0, height: 3.0),
                ),
              ),
              onPressed: () {
                print('Рейтинг');
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10.0, right: 10.0),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
            ),
            child: FlatButton(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  'Настройки',
                  style: TextStyle(fontSize: 18.0, height: 3.0),
                ),
              ),
              onPressed: () {
                print('Настройки');
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10.0, right: 10.0),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
            ),
            child: FlatButton(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  'Пригласить друга',
                  style: TextStyle(fontSize: 18.0, height: 3.0),
                ),
              ),
              onPressed: () {
                print('Пригласить друга');
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10.0, right: 10.0),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
            ),
            child: FlatButton(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  'О сервисе',
                  style: TextStyle(fontSize: 18.0, height: 3.0),
                ),
              ),
              onPressed: () {
                print('О сервисе');
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10.0, right: 10.0),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
            ),
            child: FlatButton(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  'Служба поддержки',
                  style: TextStyle(fontSize: 18.0, height: 3.0),
                ),
              ),
              onPressed: () {
                print('Служба поддержки');
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10.0, right: 10.0),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
            ),
            child: FlatButton(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  'Мы в соцсетях',
                  style: TextStyle(fontSize: 18.0, height: 3.0),
                ),
              ),
              onPressed: () {
                print('Мы в соцсетях');
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: ProfileBottomNavigation(),
    );
  }

  getProfileResources() async {
    final prefs = await SharedPreferences.getInstance();
    payTypes = prefs.getString('pay_types') ?? '';
  }
}
