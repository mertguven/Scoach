import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoach/model/user.dart';
import 'package:scoach/viewmodel/user_model.dart';
import '../design_settings.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  String _email, _sifre, _kullaniciAdi;
  User usr;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  Widget _tamAdBox() {
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
            Icons.person,
            color: Colors.white,
          ),
          hintText: 'Ad - Soyad',
          hintStyle: mHintTextStyle,
        ),
          onSaved: (String girilenKullaniciAdi) {
            _kullaniciAdi = girilenKullaniciAdi;
          }
      ),
    );
  }

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
          }),
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
          onSaved: (String girilenSifre) {
            _sifre = girilenSifre;
          }),
    );
  }

  Widget _kayitOlBtn() {
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
          "Kayıt Ol",
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

  Widget _girisYapText() {
    return Center(
      child: FlatButton(
        onPressed: () {
          Navigator.pop(context);
        },
        splashColor: Colors.transparent,
        child: Text.rich(
          TextSpan(
              text: "Hesabınız var mı? ",
              children: [
                TextSpan(
                  text: "Giris Yap!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.indigo),
                ),
              ],
              style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                        Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              _tamAdBox(),
                              SizedBox(height: 20),
                              _eMailBox(),
                              SizedBox(height: 20),
                              _sifreBox(),
                            ],
                          ),
                        ),
                        _kayitOlBtn(),
                        SizedBox(height: 10),
                        _girisYapText()
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

  _formSubmit() async{
    _formKey.currentState.save();
    final _userModel = Provider.of<UserModel>(context,listen: false);
    User _kayitOlanUser =await _userModel.createUserWithEmailandPassword(_kullaniciAdi,_email, _sifre);
    if (_kayitOlanUser != null) {
      usr = _kayitOlanUser;
      _showSnackBar();
      await _userModel.signOut();
    } else {
      usr = _kayitOlanUser;
      _showSnackBar();
    }
  }

  _showSnackBar() {
    if (usr != null) {
      final snackBar = SnackBar(
        duration: Duration(seconds: 7),
        backgroundColor: Colors.lightGreen,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.done,
              color: Colors.white,
            ),
            Text(
              "Kayıt Başarılı!",
              style: mLabelStyle,
            ),
          ],
        ),
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }
    if (usr == null) {
      final snackBar = SnackBar(
        duration: Duration(seconds: 7),
        backgroundColor: Colors.red,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.close,
              color: Colors.white,
            ),
            Text(
              "Eposta adresi hatalı veya kullanılmıs!",
              style: mLabelStyle,
            ),
          ],
        ),
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }
  }
}
