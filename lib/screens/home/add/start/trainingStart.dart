import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrainingStartPage extends StatefulWidget {

  List<dynamic> tekrarList = new List();
  List<dynamic> mesafeList = new List();
  List<dynamic> antrenmanAdiList = new List();
  List<dynamic> antrenmanAciklamasiList = new List();
  List<dynamic> sureList = new List();
  int dinlenmeSuresi = 0;


  TrainingStartPage(this.tekrarList, this.mesafeList, this.antrenmanAdiList,
      this.antrenmanAciklamasiList, this.sureList,this.dinlenmeSuresi);

  @override
  _TrainingStartPageState createState() => _TrainingStartPageState();
}

class _TrainingStartPageState extends State<TrainingStartPage> {
  final _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Color(0xFF0288D1),
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context),
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
                      Text(widget.tekrarList.toString()),
                      Text(widget.mesafeList.toString()),
                      Text(widget.antrenmanAdiList.toString()),
                      Text(widget.antrenmanAciklamasiList.toString()),
                      Text(widget.sureList.toString()),
                      Text("dinlenme süresi: ${widget.dinlenmeSuresi}"),
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
