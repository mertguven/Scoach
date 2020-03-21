import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../design_settings.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _beniHatirla = false;
  Widget _beniHatirlaCB() {
    return Container(
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _beniHatirla,
              onChanged: (value) {
                setState(() {
                  _beniHatirla = value;
                });
              },
            ),
          ),
          Text(
            'Beni hatırla',
            style: mLabelStyle,
          )
        ],
      ),
    );
  }

  Widget _kAdiBox() {
    return Container(
      decoration: mBoxDecorationStyle,
      height: 60,
      child: TextField(
        keyboardType: TextInputType.text,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 20),
            prefixIcon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            hintText: 'Kullanıcı Adı',
            hintStyle: mHintTextStyle),
      ),
    );
  }

  Widget _sifreBox() {
    return Container(
      decoration: mBoxDecorationStyle,
      height: 60,
      child: TextField(
        obscureText: true,
        keyboardType: TextInputType.text,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 20),
            prefixIcon: Icon(
              Icons.lock,
              color: Colors.white,
            ),
            hintText: 'Şifre',
            hintStyle: mHintTextStyle),
      ),
    );
  }

  Widget _loginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        padding: EdgeInsets.all(15),
        color: Color(0xFF0277BD),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          "Giriş",
          style: TextStyle(
              color: Colors.white,
              letterSpacing: 2,
              fontSize: 17,
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget _anonimBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        padding: EdgeInsets.all(15),
        color: Color(0xFF0277BD),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          "Anonim olarak giriş yap",
          style: TextStyle(
              color: Colors.white,
              letterSpacing: 2,
              fontSize: 17,
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold),
        ),
        onPressed: _misafirGirisi,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF0288D1),
                    Color(0xFF03A9F4),
                    Color(0xFF29B6F6),
                    Color(0xFF4FC3F7),
                  ],
                  stops: [
                    0.1,
                    0.4,
                    0.7,
                    0.9
                  ]),
            ),
          ),
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(vertical: 120, horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Giriş Yap',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 40),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 10),
                      _kAdiBox(),
                      SizedBox(height: 20),
                      _sifreBox(),
                      SizedBox(height: 10),
                      _beniHatirlaCB(),
                      _loginBtn(),
                      _anonimBtn(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _misafirGirisi() async {
    AuthResult sonuc = await FirebaseAuth.instance.signInAnonymously();
    AlertDialog dialog = new AlertDialog(
      content: Text(
        "Anonim giriş yapıldı.\n\n Giriş yapan anonim id: " +
            sonuc.user.uid.toString(),
        style: TextStyle(fontSize: 17),
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Kapat"),
        ),
      ],
    );
    showDialog(context: context, child: dialog);
  }
}
