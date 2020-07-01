import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoach/model/user.dart';
import 'package:scoach/screens/home/profile/changeEmail.dart';
import 'package:scoach/screens/home/profile/changePassword.dart';
import 'package:scoach/viewmodel/user_model.dart';

class HomeProfile extends StatelessWidget {
  final User user;

  const HomeProfile({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          overflow: Overflow.visible,
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 3.5,
              decoration: BoxDecoration(
                color: Color(0xFF0288D1),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60)),
              ),
            ),
            Positioned(
              bottom: -50,
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("assets/images/coach.png"),
              ),
            ),
          ],
        ),
        SizedBox(height: 80),
        _oturumAcanUser(context),
        SizedBox(height: 30),
        ListView(
          padding: EdgeInsets.all(10),
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
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF0288D1)),
                  ),
                  trailing:
                      Icon(Icons.arrow_forward_ios, color: Color(0xFF0288D1)),
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
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF0288D1)),
                  ),
                  trailing:
                      Icon(Icons.arrow_forward_ios, color: Color(0xFF0288D1)),
                ),
              ),
            ),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  onTap: () => _cikisYap(context),
                  leading: Icon(
                    Icons.exit_to_app,
                    color: Color(0xFF0288D1),
                  ),
                  title: Text(
                    "Çıkış Yap",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF0288D1)),
                  ),
                  trailing:
                      Icon(Icons.arrow_forward_ios, color: Color(0xFF0288D1)),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<bool> _cikisYap(BuildContext context) async {
    final _userModel = Provider.of<UserModel>(context, listen: false);
    bool sonuc = await _userModel.signOut();
    return sonuc;
  }

  Widget _oturumAcanUser(BuildContext context) {
    final _userModel = Provider.of<UserModel>(context);
    return Container(
      child: Center(
        child: Text(
          'Hoşgeldin ${_userModel.user.userName} !',
          style: TextStyle(
              color: Color(0xFF0288D1),
              letterSpacing: 2,
              fontSize: 17,
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
