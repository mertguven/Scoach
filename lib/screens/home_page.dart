import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoach/model/user_model.dart';
import 'package:scoach/view_model/user_model.dart';

class HomePage extends StatefulWidget {
  final User user;

  const HomePage({Key key, @required this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _page;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _oturumAcanUser(),
            SizedBox(height: 5),
            FlatButton(
              color: Color(0xFF0288D1),
              textColor: Colors.white,
              onPressed: () => _cikisYap(context),
              child: Text("Çıkış Yap"),
            ),
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          onTap: (index) {
            _page = index;
            debugPrint('page index: ' + _page.toString());
          },
          animationCurve: Curves.easeInOutQuart,
          height: 50,
          color: Color(0xFF0288D1),
          backgroundColor: Colors.white30,
          buttonBackgroundColor: Color(0xFF0288D1),
          animationDuration: Duration(milliseconds: 700),
          items: <Widget>[
            Icon(
              Icons.timeline,
              color: Colors.white,
              size: 25,
            ),
            Icon(
              Icons.add,
              color: Colors.white,
              size: 25,
            ),
            Icon(
              Icons.person,
              color: Colors.white,
              size: 25,
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _cikisYap(BuildContext context) async {
    final _userModel = Provider.of<UserModel>(context);
    bool sonuc = await _userModel.signOut();
    return sonuc;
  }

  Widget _oturumAcanUser() {
    return Container(
      child: Center(
        child: Text('Hoşgeldiniz: ${widget.user.userID}'),
      ),
    );
  }
}
