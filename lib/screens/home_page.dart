import 'dart:async';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoach/screens/home/add.dart';
import 'package:scoach/screens/home/graph.dart';
import 'package:scoach/screens/home/profile.dart';
import 'package:scoach/viewmodel/user_model.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final StreamController<int> _streamController = StreamController<int>();
  int _page = 1;

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserModel>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              StreamBuilder<int>(
                initialData: _page,
                stream: _streamController.stream,
                builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                  if (_page == 0) {
                    return HomeGraph();
                  } else if (_page == 1) {
                    return HomeAdd();
                  } else {
                    return HomeProfile(user: _userModel.user);
                  }
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          index: 1,
          onTap: (index) {
            if (index == 0) {
              _streamController.sink.add(_page = 0);
            } else if (index == 1) {
              _streamController.sink.add(_page = 1);
            } else {
              _streamController.sink.add(_page = 2);
            }
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
