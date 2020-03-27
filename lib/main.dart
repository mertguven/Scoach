import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoach/screens/login_page.dart';

void main() => runApp(MainPage());

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scoach',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: LoginPage(),
    );
  }
}
