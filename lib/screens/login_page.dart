import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoach/model/user.dart';
import 'package:scoach/screens/forgotpasword_page.dart';
import 'package:scoach/screens/home_page.dart';
import 'package:scoach/screens/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scoach/viewmodel/user_model.dart';

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

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin{
  String _email = "";
  String _sifre = "";
  FirebaseUser user;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  AnimationController controller;
  Animation<double> animation;
  Animation colorTween1;
  Animation colorTween2;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1500));

    colorTween1 = ColorTween(begin: Colors.white, end: Colors.lightGreen).animate(controller);
    colorTween2 = ColorTween(begin: Color(0xFF0277BD), end: Colors.white).animate(controller);

    animation = Tween<double>(begin: 1,end: 0).animate(controller);

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
          onChanged: (String girilenMail) {
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
              hintText: 'Sifre',
              hintStyle: mHintTextStyle,
            ),
            onChanged: (String girilenSifre) {
              _sifre = girilenSifre;
            }),
      );
    }

    Widget kontrol(){
      if(animation.value == 1){
        return Text(
          "Giriş",
          style: TextStyle(
              color: Color(0xFF0277BD),
              letterSpacing: 2,
              fontSize: 17,
              fontWeight: FontWeight.bold
          ),
        );
      }
      else if(animation.value == 0){
        return Icon(Icons.done,color: colorTween2.value);
      }
      else{
        return Container(width: 24,height: 24,child: CircularProgressIndicator());
      }
    }

    Widget _loginBtn() {
      return AnimatedBuilder(
        animation: controller,
        builder: (context, child){
          return Hero(
            tag: "getir",
            child: RaisedButton(
              elevation: 5.0,
              padding: EdgeInsets.symmetric(vertical: 15,horizontal: 120 * animation.value),
              color: colorTween1.value,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              child: kontrol(),
              onPressed: () {
                _formSubmit();
              },
            ),
          );
        },
      );
    }

    Widget _googleBtn() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: () => _googleIleGiris(),
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

    Widget _sifremiUnuttumText(){
      return Center(
        child: FlatButton(
          onPressed: () {
            Navigator.push(context, SlideRightRoute(page: ForgotPasswordPage()));
          },
          splashColor: Colors.transparent,
          child: Text("Sifreni mi Unuttun?",style: TextStyle(color: Colors.white),),
        ),
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
                        fontWeight: FontWeight.bold, color: Colors.indigo),
                  ),
                ],
                style: TextStyle(color: Colors.white)),
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
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
                padding: EdgeInsets.symmetric(vertical: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage('assets/images/logo.png'),
                      width: 150,
                      height: 150,
                    ),
                    Text(
                      "Scoach",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    SizedBox(height: 15),
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
                    SizedBox(height: 20),
                    _loginBtn(),
                    SizedBox(height: 10),
                    _sifremiUnuttumText(),
                    _googleBtn(),
                    _kayitOlText(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showSnackBar() {
    final snackBar = SnackBar(
      duration: Duration(seconds: 5),
      backgroundColor: Colors.red,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.close,
            color: Colors.white,
          ),
          Text(
            "Lütfen E-posta ve Şifre alanlarını doldurun.",
            style: mLabelStyle,
          ),
        ],
      ),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  _formSubmit() async{
    if(_email == "" || _sifre == ""){
      _showSnackBar();
    }
    else{
      _formKey.currentState.save();
      final _userModel = Provider.of<UserModel>(context,listen: false);
      User user = await _userModel.signInWithEmailandPassword(_email, _sifre, _scaffoldKey);
      if(user != null){
        controller.forward();
        controller.addStatusListener((status) {
          if(status == AnimationStatus.completed){
            Navigator.pushReplacement(context, PageRouteBuilder(transitionDuration: Duration(seconds: 1),pageBuilder: (_,__,___) => HomePage()));
          }
        });
      }
    }
  }

  _googleIleGiris() async{
    final _userModel = Provider.of<UserModel>(context,listen: false);
    User user = await _userModel.signInWithGoogle();
    if(user != null){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
    }
    else{
      print("hata var");
    }
  }
}
