import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoach/model/user_model.dart';
import 'package:scoach/viewmodel/user_model.dart';

class HomeProfile extends StatelessWidget {
  final User user;

  const HomeProfile({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _oturumAcanUser(),
        SizedBox(height: 5),
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

  Widget _oturumAcanUser() {
    return Container(
      child: Center(
        child: Text('Hoşgeldiniz ${user.userMail}'),
      ),
    );
  }
}