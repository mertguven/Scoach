import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoach/design_settings.dart';
import 'package:scoach/viewmodel/user_model.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  String _email;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage('assets/images/logo.png'),
                width: 150,
                height: 150,
              ),
              SizedBox(height:15),
              _forgotEmail(),
              _passwordReset(),
              _backToLogin(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _forgotEmail() {
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
        onChanged: (String girilenMail){
            _email = girilenMail;
        },
      ),
    );
  }

  Widget _passwordReset() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 25),
      //padding: EdgeInsets.only(top: 40),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        padding: EdgeInsets.all(15),
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          "Gönder",
          style: TextStyle(
              color: Color(0xFF0277BD),
              letterSpacing: 2,
              fontSize: 17,
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold),
        ),
        onPressed: (){
          _kontrol();
        },
      ),
    );
  }

  Widget _backToLogin() {
    return Center(
      child: FlatButton(
        onPressed: () {
          Navigator.pop(context);
          },
        splashColor: Colors.transparent,
        child: Text.rich(
          TextSpan(
              text: "Giriş Sayfasına Geri Dön",
              style: TextStyle(color: Colors.white)),
        ),
      ),
    );
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
              "Şifre yenileme e-postası gönderildi!",
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
              "Yanlış veya eksik e-posta adresi!",
              style: mLabelStyle,
            ),
          ],
        ),
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }
  }

  _kontrol() async{
    final _userModel = Provider.of<UserModel>(context,listen: false);
    bool epostaKontrol = await _userModel.forgotPassword(_email);
    if(epostaKontrol == true){
      _showSnackBar(true);
    }else{
      _showSnackBar(false);
    }
  }

}
