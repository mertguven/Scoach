import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoach/design_settings.dart';
import 'package:scoach/viewmodel/user_model.dart';

class ChangeEmailPage extends StatefulWidget {
  @override
  _ChangeEmailPageState createState() => _ChangeEmailPageState();
}

class _ChangeEmailPageState extends State<ChangeEmailPage> {
  String _mevcutEposta, _eposta;
  final _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _currentEmailBox() {
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
            hintText: 'Mevcut Eposta',
            hintStyle: mHintTextStyle,
          ),
          onChanged: (String girilenMail) {
            _mevcutEposta = girilenMail;
          }),
    );
  }

  Widget _changeEmailBox() {
    return Container(
      decoration: mBoxDecorationStyle,
      height: 60,
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: TextFormField(
          autofocus: false,
          keyboardType: TextInputType.text,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 20),
            prefixIcon: Icon(
              Icons.send,
              color: Colors.white,
            ),
            hintText: 'Eposta',
            hintStyle: mHintTextStyle,
          ),
          onChanged: (String girilenMail) {
            _eposta = girilenMail;
          }),
    );
  }

  Widget _guncelleBtn() {
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
          "Epostayı Güncelle",
          style: TextStyle(
              color: Color(0xFF0277BD),
              letterSpacing: 2,
              fontSize: 17,
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold),
        ),
        onPressed: () => _epostaDegistir(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(
            "Eposta Değiştir",
          ),
        ),
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
            Center(
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          _currentEmailBox(),
                          SizedBox(height: 20),
                          _changeEmailBox(),
                          SizedBox(height: 20),
                          _guncelleBtn(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _epostaDegistir() async {
    _formKey.currentState.save();
    final _userModel = Provider.of<UserModel>(context, listen: false);
    if (_mevcutEposta != _eposta) {
      if (_userModel.user.userMail == _mevcutEposta) {
        await _userModel.changeEmail(_eposta);
        _showSnackBar(true, true);
        _cikisYap(context);
      } else {
        _showSnackBar(false, true);
      }
    } else {
      _showSnackBar(false, false);
    }
  }

  Future<bool> _cikisYap(BuildContext context) async {
    final _userModel = Provider.of<UserModel>(context, listen: false);
    bool sonuc = await _userModel.signOut();
    return sonuc;
  }

  _showSnackBar(bool deger, bool falsedeger) {
    if (deger == true) {
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
              "E-Postanız Yenilendi!",
              style: mLabelStyle,
            ),
          ],
        ),
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }
    if (deger == false && falsedeger == true) {
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
              "Mevcut Eposta Yanlış!",
              style: mLabelStyle,
            ),
          ],
        ),
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }
    if (deger == false && falsedeger == false) {
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
              "Eposta Mevcut Epostadan Farklı Olmak Zorunda!",
              style: mLabelStyle,
            ),
          ],
        ),
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }
  }
}
