import 'package:flutter/material.dart';
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
  double _heights = 270;
  bool _isVisible = false;
  ProfileHeaderState(this.userData);
  /*
  user profile header texts 
  */
  String customerRating = '';
  String transporterRating = '';
  String dateOfBirth = '';
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
    return Stack(
      children: <Widget>[
        // Positioned(
        GestureDetector(
          onTap: () {
            if (_isHeaderOppened) {
              _isHeaderOppened = false;
              setState(() {
                _heights = 270;
                _isVisible = false;
              });
            } else {
              _isHeaderOppened = true;
              setState(() {
                _heights = 450;
                _isVisible = true;
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
                )
              ],
              color: Colors.black,
              borderRadius: new BorderRadius.only(
                bottomLeft: const Radius.circular(30.0),
                bottomRight: const Radius.circular(30.0),
              ),
            ),
            duration: Duration(microseconds: 5),
            child: Column(
              children: <Widget>[
                Container(
                  height: 110,
                  width: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                        image: AssetImage('assets/images/CROPPED-IMG_2159.JPG'),
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
                  child: Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 32),
                        padding: EdgeInsets.only(top: 15),
                        child: Row(
                          children: [
                            Icon(
                              Icons.phone,
                              color: Colors.yellow,
                              size: 20.0,
                            ),
                            Text(' '),
                            Container(
                              margin: const EdgeInsets.all(15.0),
                              padding: const EdgeInsets.all(3.0),
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
                        margin:
                            EdgeInsets.symmetric(vertical: 32, horizontal: 32),
                        padding: EdgeInsets.only(top: 15),
                        child: Row(
                          children: [
                            Icon(
                              Icons.mail,
                              color: Colors.yellow,
                              size: 20.0,
                            ),
                            Text(' '),
                            Container(
                              margin: const EdgeInsets.all(15.0),
                              padding: const EdgeInsets.all(3.0),
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
                        margin:
                            EdgeInsets.symmetric(vertical: 62, horizontal: 32),
                        padding: EdgeInsets.only(top: 15),
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
                              margin: const EdgeInsets.all(15.0),
                              padding: const EdgeInsets.all(3.0),
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
                    ],
                  ),
                ),
              ],
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
    });
  }
}
