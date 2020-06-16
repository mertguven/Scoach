import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoach/model/user_model.dart';
import 'package:scoach/screens/signup_page.dart';
import 'package:scoach/view_model/user_model.dart';

import '../design_settings.dart';

class SlideRightRoute extends PageRouteBuilder {
  final Widget page;
  SlideRightRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1, 0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
        );
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _sifre;

  final _formKey = GlobalKey<FormState>();

  void _googleIleGiris(BuildContext context) async {
    final _userModel = Provider.of<UserModel>(context);
    User _user = await _userModel.signInWithGoogle();
    if (_user != null) print("Oturum açan user id:" + _user.userID.toString());
  }

  _formSubmit() async {
    _formKey.currentState.save();
    debugPrint("eposta: ${_email.toString()} sifre:${_sifre.toString()}");
    final _userModel = Provider.of<UserModel>(context);
    User _girisYapanUser =
        await _userModel.signInWithEmailandPassword(_email, _sifre);
    if (_girisYapanUser != null)
      print("Oturum açan user id:" + _girisYapanUser.userID.toString());
  }

  @override
  Widget build(BuildContext context) {
    //final _userModel = Provider.of<UserModel>(context);

    Widget _eMailBox() {
      return Container(
        decoration: mBoxDecorationStyle,
        height: 60,
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: TextFormField(
          autofocus: false,
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 20),
            prefixIcon: Icon(
              Icons.email,
              color: Colors.white,
            ),
            hintText: 'E-posta',
            hintStyle: mHintTextStyle,
          ),
          onSaved: (String girilenMail) {
            _email = girilenMail;
          },
        ),
      );
    }

    Widget _sifreBox() {
      return Container(
        decoration: mBoxDecorationStyle,
        height: 60,
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: TextFormField(
            obscureText: true,
            autofocus: false,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 20),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Şifre',
              hintStyle: mHintTextStyle,
            ),
            onSaved: (String girilenSifre) {
              _sifre = girilenSifre;
            }),
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
          onPressed: () => _formSubmit(),
        ),
      );
    }

    Widget _googleBtn() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: () => _googleIleGiris(context),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25), color: Colors.white),
              child: Image(
                image: AssetImage('assets/images/google.png'),
                width: 40,
                height: 40,
              ),
            ),
          ),
        ],
      );
    }

    Widget _kayitOlText() {
      return Center(
        child: FlatButton(
          onPressed: () {
            Navigator.push(context, SlideRightRoute(page: SignUpPage()));
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
                        Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              _eMailBox(),
                              SizedBox(
                                height: 20,
                              ),
                              _sifreBox(),
                            ],
                          ),
                        ),
                        _loginBtn(),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "~veya~",
                              style: mHintTextStyle,
                            )
                          ],
                        ),
                        SizedBox(height: 8),
                        _googleBtn(),
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
