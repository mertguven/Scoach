import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoach/screens/home_page.dart';
import 'package:scoach/screens/login_page.dart';

void main() => runApp(MainPage());
FirebaseUser _user;

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    _checkUser();
    if (_user == null) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Scoach',
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        home: LoginPage(
          onSignIn: (user) {
            _updateUser(user);
          },
        ),
      );
    } else {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Scoach',
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        home: HomePage(
          onSignOut: () {
            _updateUser(null);
          },
        ),
      );
    }
  }

  Future<void> _checkUser() async {
    _user = await FirebaseAuth.instance.currentUser();
  }

  void _updateUser(FirebaseUser user) {
    setState(() {
      _user = user;
    });
  }
}
