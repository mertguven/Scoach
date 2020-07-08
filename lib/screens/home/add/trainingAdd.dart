import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrainingAddPage extends StatefulWidget {
  @override
  _TrainingAddPageState createState() => _TrainingAddPageState();
}

class _TrainingAddPageState extends State<TrainingAddPage> {
  final _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Color(0xFF0288D1),
          elevation: 0.4,
          leading: IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          centerTitle: true,
          title: Text(
            "Antrenman Ekle",
          ),
        ),
        body: Stack(
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
            SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: <Widget>[
                  _informations(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _informations() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: ListTile(
                leading: Icon(Icons.straighten,color: Colors.amber,size: 36),
                title: Center(child: Text("Mesafe",style: TextStyle(color: Colors.amber,fontSize: 20,fontWeight: FontWeight.w500))),
                subtitle: Center(child: Text("800 m",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold))),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: ListTile(
                leading: Icon(Icons.pool,color: Colors.brown,size: 36),
                title: Center(child: Text("Havuz Boyu",style: TextStyle(color: Colors.brown,fontSize: 20,fontWeight: FontWeight.w500))),
                subtitle: Center(child: Text("50 m",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold))),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: ListTile(
              leading: Icon(Icons.timer,color: Colors.indigo,size: 36),
              title: Center(child: Text("Zaman",style: TextStyle(color: Colors.indigo,fontSize: 20,fontWeight: FontWeight.w500))),
              subtitle: Center(child: Text("3 dk",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold))),
            ),
          ),
        ),
      ],
    );
  }
}
