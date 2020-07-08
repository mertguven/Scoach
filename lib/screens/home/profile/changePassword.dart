import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoach/design_settings.dart';
import 'package:scoach/viewmodel/user_model.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {

  String _sifre, _sifreTekrar;
  final _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
      onChanged: (String girilenSifre){
            _sifre = girilenSifre;
      }),
    );
  }

  Widget _sifreTekrarBox() {
    return Container(
      decoration: mBoxDecorationStyle,
      height: 60,
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: TextFormField(
          obscureText: true,
          autofocus: false,
          keyboardType: TextInputType.text,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 20),
            prefixIcon: Icon(
              Icons.keyboard_return,
              color: Colors.white,
            ),
            hintText: 'Tekrar Şifre',
            hintStyle: mHintTextStyle,
          ),
          onChanged: (String girilenSifre){
            _sifreTekrar = girilenSifre;
          }
      ),
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
          "Şifreyi Güncelle",
          style: TextStyle(
              color: Color(0xFF0277BD),
              letterSpacing: 2,
              fontSize: 17,
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold),
        ),
        onPressed: () => _sifreDegistir(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Color(0xFF0288D1),
          elevation: 0.4,
          leading: IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          centerTitle: true,
          title: Text(
            "Şifre Değiştir",
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
                          _sifreBox(),
                          SizedBox(height: 20),
                          _sifreTekrarBox(),
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

  _sifreDegistir() async{
    _formKey.currentState.save();
    if(_sifre == _sifreTekrar && _sifre.length >= 6){
      final _userModel = Provider.of<UserModel>(context, listen: false);
      bool sonuc = await _userModel.changePassword(_sifre);
      if(sonuc == true){
        _showSnackBar(true);
      }else{
        _showSnackBar(false);
      }
    }else{
      _showSnackBar(false);
    }
  }

  _showSnackBar(bool deger) {
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
              "Şifreniz Yenilendi!",
              style: mLabelStyle,
            ),
          ],
        ),
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }
    if (deger == false) {
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
              "Şifreler aynı değil veya yanlış şifre kullanımı!",
              style: mLabelStyle,
            ),
          ],
        ),
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }
  }

}
