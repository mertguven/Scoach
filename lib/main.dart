import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoach/screens/home_page.dart';
import 'package:scoach/screens/login_page.dart';

void main() => runApp(LoginApp());
FirebaseUser _user;

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _checkUser();
    if (_user == null) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Scoach',
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        home: LoginPage(),
      );
    }
    if (_user != null) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Scoach',
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        home: HomePage(),
      );
    }
  }
}

Future<void> _checkUser() async {
  _user = await FirebaseAuth.instance.currentUser();
}
