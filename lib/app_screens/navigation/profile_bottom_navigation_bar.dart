import 'package:flutter/material.dart';
import '../pages/trips.dart';

class ProfileBottomNavigation extends StatefulWidget {
  @override
  _ProfileBottomNavigationState createState() =>
      _ProfileBottomNavigationState();
}

class _ProfileBottomNavigationState extends State<ProfileBottomNavigation> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      fixedColor: Colors.yellow,
      backgroundColor: Colors.black,
      // selectedItemColor: Colors.black,
      // unselectedItemColor: Colors.white,
      iconSize: 40,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/map.png',
            color: Colors.white,
          ),
          title: Text(
            '',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/bag.png',
            // color: Colors.white,
          ),
          title: Text(
            '',
            style: TextStyle(
                // color: Colors.white,
                ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/home.png',
            // color: Colors.white,
          ),
          title: Text(
            '',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/sailak.png',
            // color: Colors.white,
          ),
          title: Text(''),
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/rooper.png',
            // color: Colors.white,
          ),
          title: Text(''),
        ),
      ],
      onTap: (index) {
        setState(() {
          _currentIndex = index;
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (BuildContext context) => Trips()),
              (Route<dynamic> route) => false);
        });
      },
    );
  }
}
