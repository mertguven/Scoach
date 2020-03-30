import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoach/screens/home/add.dart';
import 'package:scoach/screens/home/graph.dart';
import 'package:scoach/screens/home/profile.dart';
import 'package:scoach/view_model/user_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _page = 0;
  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserModel>(context);
    final controller = PageController(initialPage: _page);
    final pageView = PageView(
      controller: controller,
      children: <Widget>[
        HomeGraph(),
        HomeAdd(),
        HomeProfile(user: _userModel.user)
      ],
    );
    return SafeArea(
      child: Scaffold(
        body: pageView,
        bottomNavigationBar: CurvedNavigationBar(
          onTap: (index) {
            setState(() {
              _page = index;
              debugPrint('page index: ' + _page.toString());
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
      ),
    );
  }
}
