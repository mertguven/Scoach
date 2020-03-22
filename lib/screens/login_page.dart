import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../design_settings.dart';

class LoginPage extends StatelessWidget {
  final Function(FirebaseUser) onSignIn;

  const LoginPage({Key key, @required this.onSignIn}) : super(key: key);
  void _misafirGirisi() async {
    AuthResult sonuc = await FirebaseAuth.instance.signInAnonymously();
    onSignIn(sonuc.user);
  }

  @override
  Widget build(BuildContext context) {
    bool _beniHatirla = false;

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
        padding: EdgeInsets.symmetric(vertical: 10.0),
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

    return SafeArea(
      child: Scaffold(
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
                padding: EdgeInsets.symmetric(vertical: 50, horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage('assets/images/logo.png'),
                      width: 150,
                      height: 150,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 10),
                        _kAdiBox(),
                        SizedBox(height: 20),
                        _sifreBox(),
                        SizedBox(height: 10),
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
      ),
    );
  }
}
