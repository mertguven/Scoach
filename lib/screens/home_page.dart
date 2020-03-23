import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final VoidCallback onSignOut;

  Future<void> _cikisYap() async {
    await FirebaseAuth.instance.signOut();
    onSignOut();
  }

  const HomePage({Key key, @required this.onSignOut}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ANASAYFA"),
        actions: <Widget>[
          FlatButton(
            onPressed: _cikisYap,
            child: Text(
              "Çıkış",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Container(
        child: Text("güncelleme deneme"),
      ),
    );
  }
}
