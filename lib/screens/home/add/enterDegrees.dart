import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoach/model/swimmer.dart';
import 'package:scoach/viewmodel/user_model.dart';

import '../../../design_settings.dart';

class EnterDegreesPage extends StatefulWidget {
  @override
  _EnterDegreesPageState createState() => _EnterDegreesPageState();
}

class _EnterDegreesPageState extends State<EnterDegreesPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  dynamic takim = "";
  int yas = 0;
  int mesafe = 0;
  String stil = "";
  String adSoyad = "";
  var rnd = Random();
  bool sonSonuc;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.4,
          leading: IconButton(
            icon: Icon(
              Icons.close,
              color: Color(0xFF0288D1),
            ),
            onPressed: () => Navigator.pop(context),
          ),
          centerTitle: true,
          title: Text(
            "Derece Kayıt",
            style: TextStyle(
              color: Color(0xFF0288D1),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0),
          child: Container(
            height: 56,
            child: FlatButton(
              // Color(0xFF0288D1)
              color: Color(0xFF0288D1),
              onPressed: () {},
              child: Text(
                "Kaydet",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  letterSpacing: 2,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: <Widget>[
              _setChoise(),
              _setMainEnterDegree(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _setChoise() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          SizedBox(height: 5),
          RaisedButton(
            onPressed: () => _showNewSwimmerDialog(),
            elevation: 4,
            color: Color(0xFF29B6F6),
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(
                  Icons.add_circle,
                  color: Colors.white,
                  size: 30,
                ),
                Text(
                  "Yeni Sporcu Ekle",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          SizedBox(height: 15),
          RaisedButton(
            onPressed: () => _showChoiceSwimmerDialog(),
            color: Color(0xFF29B6F6),
            elevation: 4,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(
                  Icons.face,
                  color: Colors.white,
                  size: 33,
                ),
                Text(
                  "Sporcu Seç",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            height: 1,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget _customTextField(String labelText, Icon icon, TextInputType type) {
    return TextField(
      keyboardType: type,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        suffixIcon: icon,
        labelText: labelText,
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF29B6F6))),
        labelStyle: TextStyle(color: Color(0xFF0288D1)),
      ),
      style: TextStyle(
        color: Color(0xFF0288D1),
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      onChanged: (dynamic girilen){
        if(labelText == "Ad Soyad"){
          adSoyad = girilen;
        }
        if(labelText == "Yaş"){
          int deger = int.parse(girilen);
          yas = deger;
        }
        if(labelText == "Takım"){
          takim = girilen;
        }
      },
    );
  }

  Future<bool> _showChoiceSwimmerDialog() {
    return showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              content: Column(
                children: <Widget>[
                  SizedBox(height: 15),
                  _customTextField(
                      "Ad Soyad", Icon(Icons.text_format), TextInputType.text),
                  SizedBox(height: 15),
                  _customTextField(
                      "Yaş", Icon(Icons.chrome_reader_mode), TextInputType.number),
                  SizedBox(height: 15),
                  _customTextField(
                      "Takım", Icon(Icons.group), TextInputType.text),
                ],
              ),
            ),
          );
        });
  }

  Future<bool> _showNewSwimmerDialog() {
    return showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              content: Column(
                children: <Widget>[
                  SizedBox(height: 15),
                  _customTextField(
                      "Ad Soyad", Icon(Icons.text_format), TextInputType.text),
                  SizedBox(height: 15),
                  _customTextField(
                      "Yaş", Icon(Icons.chrome_reader_mode), TextInputType.number),
                  SizedBox(height: 15),
                  _customTextField(
                      "Takım", Icon(Icons.group), TextInputType.text),
                ],
              ),
              actions: <Widget>[
                FlatButton(
                  color: Colors.lightGreen,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onPressed: () {
                      if(adSoyad == null){
                        print("hata");
                      }else {
                        _formSubmit();
                      }
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.done,
                        color: Colors.white,
                      ),
                      Text(
                        "Kaydet",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  _formSubmit() async{
    final _userModel = Provider.of<UserModel>(context,listen: false);
    Swimmer swimmer = Swimmer(swimmerId: rnd.nextInt(9999), swimmerAge: yas, swimmerNameSurname: adSoyad, swimmerTeam: takim);
    bool sonuc =  await  _userModel.saveSwimmer(swimmer, _userModel.user);
    if (sonuc == true) {
      sonSonuc = sonuc;
      _showSnackBar();
    } else {
      sonSonuc = sonuc;
      _showSnackBar();
    }
  }
  _showSnackBar() {
    if (sonSonuc != null) {
      final snackBar = SnackBar(
        duration: Duration(seconds: 7),
        backgroundColor: Colors.lightGreen,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.done,
              color: Colors.white,
            ),
            Text(
              "Sporcu başarılı bir şekilde kaydedildi!",
              style: mLabelStyle,
            ),
          ],
        ),
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }
    if (sonSonuc == null) {
      final snackBar = SnackBar(
        duration: Duration(seconds: 7),
        backgroundColor: Colors.red,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.close,
              color: Colors.white,
            ),
            Text(
              "Sporcuyu kaydederken bir hata oluştu!",
              style: mLabelStyle,
            ),
          ],
        ),
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }
  }

  Widget _setMainEnterDegree() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          SizedBox(height: 20),
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.person, color: Color(0xFF0288D1), size: 25),
                      SizedBox(width: 5),
                      Text("Ad Soyad",style: TextStyle(
                          color: Color(0xFF0288D1),
                          fontSize: 20,
                          fontWeight: FontWeight.w400),),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.group, color: Color(0xFF0288D1), size: 25),
                      SizedBox(width: 5),
                      Text("Takım",style: TextStyle(
                          color: Color(0xFF0288D1),
                          fontSize: 20,
                          fontWeight: FontWeight.w400),),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.chrome_reader_mode, color: Color(0xFF0288D1), size: 25),
                      SizedBox(width: 5),
                      Text("Yaş",style: TextStyle(
                          color: Color(0xFF0288D1),
                          fontSize: 20,
                          fontWeight: FontWeight.w400),),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.date_range, color: Color(0xFF0288D1), size: 25),
                      SizedBox(width: 5),
                      Text("Doğum Tarihi",style: TextStyle(
                          color: Color(0xFF0288D1),
                          fontSize: 20,
                          fontWeight: FontWeight.w400),),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 10,bottom: 20),
            height: 1,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey,
          ),
          Column(
            children: <Widget>[
              TextField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.straighten),
                  labelText: "Mesafe",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF29B6F6))),
                  labelStyle: TextStyle(color: Color(0xFF0288D1)),
                ),
                style: TextStyle(
                  color: Color(0xFF0288D1),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                onChanged: (dynamic girilen){
                  int deger = int.parse(girilen);
                  mesafe = deger;
                },
              ),
              SizedBox(height: 10),
              TextField(
                keyboardType: TextInputType.text,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.pool),
                  labelText: "Stil",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF29B6F6))),
                  labelStyle: TextStyle(color: Color(0xFF0288D1)),
                ),
                style: TextStyle(
                  color: Color(0xFF0288D1),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                onChanged: (dynamic girilen){
                  stil = girilen;
                },
              ),
              SizedBox(height: 10),
              TextField(
                keyboardType: TextInputType.text,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.timer),
                  labelText: "Süre",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF29B6F6))),
                  labelStyle: TextStyle(color: Color(0xFF0288D1)),
                ),
                style: TextStyle(
                  color: Color(0xFF0288D1),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                onChanged: (dynamic girilen){
                  stil = girilen;
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
