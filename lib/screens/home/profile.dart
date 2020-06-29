import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoach/model/user.dart';
import 'package:scoach/viewmodel/user_model.dart';

class HomeProfile extends StatelessWidget {
  final User user;

  const HomeProfile({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          overflow: Overflow.visible,
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height /3.5,
              decoration: BoxDecoration(
                color: Color(0xFF0288D1),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60),bottomRight: Radius.circular(60)),
              ),
            ),
            Positioned(
              bottom: -50,
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("assets/images/coach.png"),
              ),
            ),
          ],
        ),
        SizedBox(height: 80),
        _oturumAcanUser(context),
        SizedBox(height: 30),
        FlatButton(
          color: Color(0xFF0288D1),
          textColor: Colors.white,
          onPressed: () {},
          child: Text("Şifre Değiştir"),
        ),
        SizedBox(height: 10),
        FlatButton(
          color: Color(0xFF0288D1),
          textColor: Colors.white,
          onPressed: () {},
          child: Text("E-Posta Değiştir"),
        ),
        SizedBox(height: 10),
        FlatButton(
          color: Color(0xFF0288D1),
          textColor: Colors.white,
          onPressed: () => _cikisYap(context),
          child: Text("Çıkış Yap"),
        ),
      ],
    );
  }

  Future<bool> _cikisYap(BuildContext context) async {
    final _userModel = Provider.of<UserModel>(context,listen: false);
    bool sonuc = await _userModel.signOut();
    return sonuc;
  }

  Widget _oturumAcanUser(BuildContext context){
    final _userModel = Provider.of<UserModel>(context);
    return Container(
      child: Center(
        child: Text('Hoşgeldin ${_userModel.user.userName} !',
          style: TextStyle(
              color: Colors.black,
              letterSpacing: 2,
              fontSize: 17,
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}