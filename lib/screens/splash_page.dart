import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoach/screens/home_page.dart';
import 'package:scoach/screens/login_page.dart';
import 'package:scoach/viewmodel/user_model.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserModel>(context);
    if (_userModel.state == ViewState.Idle) {
      if (_userModel.user == null) {
        return LoginPage();
      } else {
        return HomePage();
      }
    } else {
      return Scaffold(
        body: Center(
          child: SizedBox(
            child: Center(
              child: SizedBox(
                child: TextLiquidFill(
                  boxHeight: MediaQuery.of(context).size.height,
                  boxWidth: MediaQuery.of(context).size.width,
                  loadDuration: Duration(seconds: 2),
                  text: "Scoach",
                  waveColor: Color(0xFF0277BD),
                  boxBackgroundColor: Colors.white,
                  textStyle: TextStyle(
                    fontSize: 80.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}
