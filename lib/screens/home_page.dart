import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text(
              "ANA SAYFA",
              style: TextStyle(color: Colors.black38),
            ),
          ),
          RaisedButton(
            onPressed: () {},
            child: Text("ÇIKIŞ"),
          )
        ],
      ),
    );
  }
}
