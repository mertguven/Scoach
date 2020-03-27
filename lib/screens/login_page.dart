import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoach/screens/signup_page.dart';

import '../design_settings.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _eMailBox() {
      return Container(
        decoration: mBoxDecorationStyle,
        height: 60,
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: TextField(
          keyboardType: TextInputType.text,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 20),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'E-posta',
              hintStyle: mHintTextStyle),
        ),
      );
    }

    Widget _sifreBox() {
      return Container(
        decoration: mBoxDecorationStyle,
        height: 60,
        margin: EdgeInsets.symmetric(horizontal: 40),
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
        margin: EdgeInsets.symmetric(horizontal: 50),
        padding: EdgeInsets.only(top: 40),
        width: double.infinity,
        child: RaisedButton(
          elevation: 5.0,
          padding: EdgeInsets.all(15),
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            "Giriş",
            style: TextStyle(
                color: Color(0xFF0277BD),
                letterSpacing: 2,
                fontSize: 17,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            //Navigator.push(context, MaterialPageRoute(builder: (context)=> SplashPage()));
          },
        ),
      );
    }

    Widget _anonimBtn() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 90),
        padding: EdgeInsets.symmetric(vertical: 10.0),
        width: double.infinity,
        child: RaisedButton.icon(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          elevation: 5,
          color: Colors.white,
          onPressed: () {},
          icon: Icon(
            Icons.android,
            color: Color(0xFF0277BD),
          ),
          label: Text(
            "Anonim Giriş Yap",
            style: TextStyle(
                color: Color(0xFF0277BD),
                letterSpacing: 1,
                fontSize: 15,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold),
          ),
        ),
      );
    }

    Widget _kayitOlText() {
      return Center(
        child: FlatButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignUpPage(),
              ),
            );
          },
          splashColor: Colors.transparent,
          child: Text.rich(
            TextSpan(
                text: "Hesabınız yok mu? ",
                children: [
                  TextSpan(
                    text: "Kayıt Ol!",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blueAccent),
                  ),
                ],
                style: mHintTextStyle),
          ),
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
                padding: EdgeInsets.symmetric(vertical: 75),
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
                        _eMailBox(),
                        SizedBox(height: 20),
                        _sifreBox(),
                        _loginBtn(),
                        _anonimBtn(),
                        _kayitOlText(),
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
