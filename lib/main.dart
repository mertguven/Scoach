import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoach/locator.dart';
import 'package:scoach/screens/splash_page.dart';
import 'package:scoach/viewmodel/user_model.dart';

void main() {
  setupLocator();
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserModel(),
      child: MaterialApp(
        title: 'Scoach',
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
      ),
    );
  }
}
