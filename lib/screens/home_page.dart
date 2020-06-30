import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoach/screens/home/add_page.dart';
import 'package:scoach/screens/home/graph_page.dart';
import 'package:scoach/screens/home/profile_page.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _page = 1;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: changePage(),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 1,
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        animationCurve: Curves.easeInOutQuart,
        height: 50,
        color: Color(0xFF0288D1),
        backgroundColor: Colors.white30,
        buttonBackgroundColor: Color(0xFF0288D1),
        animationDuration: Duration(milliseconds: 700),
        items: <Widget>[
          Icon(
            Icons.timeline,
            color: Colors.white,
            size: 25,
          ),
          Icon(
            Icons.add,
            color: Colors.white,
            size: 25,
          ),
          Icon(
            Icons.person,
            color: Colors.white,
            size: 25,
          ),
        ],
      ),
    );
  }

  changePage() {
    if(_page == 0){
      return HomeGraph();
    }if(_page == 1){
      return HomeAdd();
    }if(_page == 2){
      return HomeProfile();
    }
  }
}