import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoach/screens/home_page.dart';
import 'package:scoach/screens/login_page.dart';
import 'package:scoach/view_model/user_model.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserModel>(context);
    if (_userModel.state == ViewState.Idle) {
      if (_userModel.user == null) {
        return LoginPage();
      } else {
        return HomePage(user: _userModel.user);
      }
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
