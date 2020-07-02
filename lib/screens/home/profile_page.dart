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
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF0288D1),
                    Color(0xFF03A9F4),
                    Color(0xFF29B6F6),
                    Color(0xFF4FC3F7),
                  ],
                  stops: [
                    0.1,
                    0.4,
                    0.7,
                    0.9
                  ]),
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height / 2.5,
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage("https://yt3.ggpht.com/a/AATXAJwJVBfsCQpbbcsvEf3NKf23oU4d5aVweHNe8sDWrA=s100-c-k-c0xffffffff-no-rj-mo"),
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
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60)
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
              color: Colors.white,
            ),
            SizedBox(width: 5),
            Text(
              '${_userModel.user.userName}',
              style: TextStyle(
                  color: Colors.white,
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
              color: Colors.white,
            ),
            SizedBox(width: 5),
            Text(
              '${_userModel.user.userMail}',
              style: TextStyle(
                  color: Colors.white,
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
