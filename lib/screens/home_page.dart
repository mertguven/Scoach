import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoach/model/user_model.dart';
import 'package:scoach/view_model/user_model.dart';

class HomePage extends StatelessWidget {
  final User user;

  const HomePage({Key key, @required this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ANASAYFA"),
        actions: <Widget>[
          FlatButton(
            onPressed: () => _cikisYap(context),
            child: Text(
              "Çıkış",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Center(
        child: Text("Hoşgeldiniz ${user.userID}"),
      ),
    );
  }

  Future<void> _cikisYap(BuildContext context) async {
    final _userModel = Provider.of<UserModel>(context);
    bool sonuc = await _userModel.signOut();
    return sonuc;
  }
}
