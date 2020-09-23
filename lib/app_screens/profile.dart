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
  UserProfileState(this.userData);
  /* 
  profile texts rources
  */
  String payTypes = '';
  String raiting = '';
  String emailInputtext = '';
  String settings = '';
  String inviteFriend = '';
  String aboutService = '';
  String support = '';
  String weInSocialmedia = '';

  @override
  void initState() {
    getProfileResources();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          // ProfileHeader(
          //   userData: userData,
          // ),
          Container(
            margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 275.0),
            padding: EdgeInsets.only(top: 10),
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
            margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 355),
            padding: EdgeInsets.only(top: 10),
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
                  raiting,
                  style: TextStyle(fontSize: 18.0, height: 3.0),
                ),
              ),
              onPressed: () {
                print(raiting);
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 415.0),
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
                  settings,
                  style: TextStyle(fontSize: 18.0, height: 3.0),
                ),
              ),
              onPressed: () {
                print(settings);
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 465),
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
                  inviteFriend,
                  style: TextStyle(fontSize: 18.0, height: 3.0),
                ),
              ),
              onPressed: () {
                print(inviteFriend);
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 515),
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
                  aboutService,
                  style: TextStyle(fontSize: 18.0, height: 3.0),
                ),
              ),
              onPressed: () {
                print(aboutService);
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 565),
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
                  support,
                  style: TextStyle(fontSize: 18.0, height: 3.0),
                ),
              ),
              onPressed: () {
                print(support);
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 615),
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
                  weInSocialmedia,
                  style: TextStyle(fontSize: 18.0, height: 3.0),
                ),
              ),
              onPressed: () {
                print(weInSocialmedia);
              },
            ),
          ),
          ProfileHeader(
            userData: userData,
          ),
        ],
      ),
      bottomNavigationBar: ProfileBottomNavigation(),
    );
  }

  /*
  get profile page resources from store for simple data.
  */
  getProfileResources() async {
    final prefs = await SharedPreferences.getInstance();

    /*
    rebuild profile widget with new variables
    */
    setState(() {
      payTypes = prefs.getString('pay_types') ?? '';
      raiting = prefs.getString('raiting') ?? '';
      settings = prefs.getString('settings') ?? '';
      inviteFriend = prefs.getString('invite') ?? '';
      aboutService = prefs.getString('about') ?? '';
      support = prefs.getString('support') ?? '';
      weInSocialmedia = prefs.getString('socials') ?? '';
    });
  }
}
