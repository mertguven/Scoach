import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoach/model/user.dart';
import 'package:scoach/screens/home/profile/changeEmail.dart';
import 'package:scoach/screens/home/profile/changePassword.dart';
import 'package:scoach/viewmodel/user_model.dart';

class HomeProfile extends StatefulWidget {
  final User user;

  const HomeProfile({Key key, this.user}) : super(key: key);

  @override
  _HomeProfileState createState() => _HomeProfileState();
}

class _HomeProfileState extends State<HomeProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          Opacity(
            opacity: 0.7,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/profilebg.png"),
                ),
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("assets/images/coach.png"),
                    ),
                    SizedBox(height: 20),
                    _oturumAcanUser(context),
                    _cikisBtn(),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(100),
                          topRight: Radius.circular(100)
                      ),
                    ),
                    child: ListView(
                      primary: false,
                      padding: EdgeInsets.all(14),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: <Widget>[
                        Card(
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ChangeEmailPage(),
                                  ),
                                );
                              },
                              leading: Icon(
                                Icons.email,
                                color: Color(0xFF0288D1),
                              ),
                              title: Text(
                                "E-posta Değiştir",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF0288D1)),
                              ),
                              trailing: Icon(Icons.arrow_forward_ios,
                                  color: Color(0xFF0288D1)),
                            ),
                          ),
                        ),
                        Card(
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ChangePasswordPage(),
                                  ),
                                );
                              },
                              leading: Icon(
                                Icons.lock,
                                color: Color(0xFF0288D1),
                              ),
                              title: Text(
                                "Şifre Değiştir",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF0288D1),
                                ),
                              ),
                              trailing: Icon(Icons.arrow_forward_ios,
                                  color: Color(0xFF0288D1)),
                            ),
                          ),
                        ),
                      ],
                    )
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _cikisBtn() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 100),
      padding: EdgeInsets.only(top: 20),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        padding: EdgeInsets.all(12),
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(
              Icons.exit_to_app,
              color: Color(0xFF0277BD),
            ),
            Text(
              "Çıkış Yap",
              style: TextStyle(
                  color: Color(0xFF0277BD),
                  letterSpacing: 2,
                  fontSize: 18,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        onPressed: () => _cikisYap(context),
      ),
    );
  }

  Future<bool> _cikisYap(BuildContext context) async {
    final _userModel = Provider.of<UserModel>(context, listen: false);
    bool sonuc = await _userModel.signOut();
    return sonuc;
  }

  Widget _oturumAcanUser(BuildContext context) {
    final _userModel = Provider.of<UserModel>(context);
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.person,
              color: Color(0xFF0277BD),
            ),
            Text(
              '${_userModel.user.userName}',
              style: TextStyle(
                  color: Color(0xFF0277BD),
                  letterSpacing: 2,
                  fontSize: 20,
                  shadows: [
                    Shadow(
                      color: Color(0xFF0277BD),
                      blurRadius: 1.5
                    )
                  ],
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 7),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.mail,
              color: Color(0xFF0277BD),
            ),
            Text(
              '${_userModel.user.userMail}',
              style: TextStyle(
                  color: Color(0xFF0277BD),
                  letterSpacing: 1,
                  fontSize: 18,
                  shadows: [
                    Shadow(
                        color: Color(0xFF0277BD),
                        blurRadius: 1.5
                    )
                  ],
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
