import 'package:delse/app_screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class ProfileHeader extends StatefulWidget {
  Map userData;
  ProfileHeader({Key key, this.userData}) : super(key: key);
  @override
  ProfileHeaderState createState() => ProfileHeaderState(userData);
}

class ProfileHeaderState extends State<ProfileHeader> {
  Map userData;
  bool _isHeaderOppened = false;
  double _heights = 290;
  bool _isVisible = false;
  ProfileHeaderState(this.userData);
  /*
  user profile header texts 
  */
  String customerRating = '';
  String transporterRating = '';
  String dateOfBirth = '';
  String logout = '';
  var _dropDownIcon = Icons.arrow_drop_down;
  /*
  get profile header resources from store for simple data.
  */
  @override
  void initState() {
    getProfileHeaderResources();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var baseline = CrossAxisAlignment.baseline;
    return Stack(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            if (_isHeaderOppened) {
              _isHeaderOppened = false;
              setState(() {
                _heights = 294;
                _isVisible = false;
                _dropDownIcon = Icons.arrow_drop_down;
              });
            } else {
              _isHeaderOppened = true;
              setState(() {
                _heights = 440;
                _isVisible = true;
                _dropDownIcon = Icons.arrow_drop_up;
              });
            }
          },
          child: AnimatedContainer(
            height: _heights,
            padding: EdgeInsets.only(top: 60.0),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 2.0,
                  spreadRadius: 1.0,
                ),
              ],
              color: Colors.black,
              borderRadius: new BorderRadius.only(
                bottomLeft: const Radius.circular(30.0),
                bottomRight: const Radius.circular(30.0),
              ),
            ),
            duration: Duration(microseconds: 5),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 110,
                    width: 110,
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                          image:
                              AssetImage('assets/images/CROPPED-IMG_2159.JPG'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Text(
                    userData['firstName'] + '  ' + userData['lastName'],
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    userData['country'] + ',  ' + userData['city'],
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text(
                              customerRating + ' :',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              transporterRating + ' :',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text(
                              userData['ordererLevelName'],
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              userData['transporterLevelName'],
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: _isVisible,
                    child: Container(
                      margin: EdgeInsets.only(top: 25.0, left: 25.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.phone,
                                  color: Colors.yellow,
                                  size: 20.0,
                                ),
                                Text(' '),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        width: 1.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    userData['phoneNumber'],
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 7.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.mail,
                                  color: Colors.yellow,
                                  size: 20.0,
                                ),
                                Text(' '),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        width: 1.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    userData['email'],
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 7.0),
                            child: Row(
                              children: [
                                Text(
                                  dateOfBirth + ':',
                                  style: TextStyle(
                                    color: Colors.yellow,
                                  ),
                                ),
                                Text(' '),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        width: 1.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    userData['birthDate'],
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // margin: EdgeInsets.only(top: 10.0, right: 15.0),
                            alignment: Alignment.bottomRight,
                            child: FlatButton(
                              child: SizedBox(
                                child: Text(
                                  logout,
                                  style: TextStyle(
                                    color: Colors.yellow,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Login()),
                                    (Route<dynamic> route) => false);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Icon(
                      _dropDownIcon,
                      color: Colors.grey,
                      size: 32.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // edit button with click
        Positioned(
          top: 60,
          right: 20,
          child: Container(
            child: Icon(
              Icons.edit,
              color: Colors.white,
              size: 25.0,
            ),
          ),
        ),
      ],
    );
  }

  getProfileHeaderResources() async {
    final prefs = await SharedPreferences.getInstance();
    /*
    rebuild profile header with new variables
    */
    setState(() {
      customerRating = prefs.getString('customer_rating') ?? '';
      transporterRating = prefs.getString('transporter_rating') ?? '';
      dateOfBirth = prefs.getString('birthday') ?? '';
      logout = prefs.getString('logout') ?? '';
    });
  }
}
