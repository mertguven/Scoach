import 'package:bottom_navy_bar/bottom_navy_bar.dart';
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
      bottomNavigationBar: BottomNavyBar(
        key: _bottomNavigationKey,
        selectedIndex: _page,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        backgroundColor: Color(0xFF0288D1),
        onItemSelected: (index) {
          setState(() {
            _page = index;
          });
        },
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.equalizer, color: Colors.white),
            activeColor: Colors.black,
            textAlign: TextAlign.center,
            title: Text(
              "Grafik",
              style: TextStyle(color: Colors.white),
            ),
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.add, color: Colors.white),
            activeColor: Colors.black,
            textAlign: TextAlign.center,
            title: Text(
              "Ekle",
              style: TextStyle(color: Colors.white),
            ),
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.person, color: Colors.white),
            activeColor: Colors.black,
            textAlign: TextAlign.center,
            title: Text(
              "Profil",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  changePage() {
    if (_page == 0) {
      return HomeGraph();
    }
    if (_page == 1) {
      return HomeAdd();
    }
    if (_page == 2) {
      return HomeProfile();
    }
  }
}
