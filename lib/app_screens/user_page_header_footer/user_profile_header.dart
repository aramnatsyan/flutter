import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProfileHeader extends StatefulWidget {
  Map userData;
  ProfileHeader({Key key, this.userData}) : super(key: key);
  @override
  ProfileHeaderState createState() => ProfileHeaderState(userData);
}

class ProfileHeaderState extends State<ProfileHeader> {
  Map userData;
  ProfileHeaderState(this.userData);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.only(bottom: 10.0),
        height: MediaQuery.of(context).size.height / 3,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 3.0,
              spreadRadius: 2.0,
            )
          ],
          color: Colors.black,
          borderRadius: new BorderRadius.only(
            bottomLeft: const Radius.circular(40.0),
            bottomRight: const Radius.circular(40.0),
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
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
                        'Рейтинг Заказчика:',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        'Рейтинг Перевозчика:',
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
          ],
        ),
      ),
    );
  }
}
