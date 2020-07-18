import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrainingIsCompletePage extends StatefulWidget {
  @override
  _TrainingIsCompletePageState createState() => _TrainingIsCompletePageState();
}

class _TrainingIsCompletePageState extends State<TrainingIsCompletePage> {
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
            "Dereceleri Gir",
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
            Center(
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Text("Antrenman Tamamlandı !",style: TextStyle(color: Colors.white,fontSize: 100),)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
