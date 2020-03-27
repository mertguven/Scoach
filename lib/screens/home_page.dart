import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ANASAYFA"),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
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
