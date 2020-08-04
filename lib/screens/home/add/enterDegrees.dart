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

  dynamic yeniTakim = "";
  int yeniYas = 0;
  int mesafe = 0;
  String stil = "Serbest";
  int sure = 0;
  String yeniAdSoyad = "";
  var rnd = Random();
  bool sonSonuc;
  int kontrol = 1;
  String secilenAd = "Ad Soyad";
  String secilenTakim = "Takım";
  String secilenDTarihi = "Doğum Tarihi";
  String secilenYas = "Yaş";
  int secilenId = 0;
  String _value = "";
  String snackBarMessage = "";
  List<String> _values = new List<String>();

  @override
  void initState() {
    _values.addAll(["Serbest","Kurbağa","Sırt","Kelebek"]);
    _value = _values.elementAt(0);
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
              onPressed: () => kaydet(),
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
            elevation: 10,
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
            elevation: 10,
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
      onChanged: (dynamic girilen) {
        if (labelText == "Ad Soyad") {
          yeniAdSoyad = girilen;
        }
        if (labelText == "Yaş") {
          int deger = int.parse(girilen);
          yeniYas = deger;
        }
        if (labelText == "Takım") {
          yeniTakim = girilen;
        }
      },
    );
  }

  Future<bool> _showChoiceSwimmerDialog() {
    final _userModel = Provider.of<UserModel>(context, listen: false);
    return showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
              return SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  content: Container(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width / 2,
                    child: FutureBuilder<List<Swimmer>>(
                      future: _userModel.getAllSwimmer(_userModel.user),
                      builder: (context, sonuc) {
                        if (sonuc.hasData) {
                          var tumSporcular = sonuc.data;
                          if (tumSporcular.length > 0) {
                            return ListView.builder(
                              itemCount: tumSporcular.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.symmetric(vertical: 7),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white60,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.4),
                                        spreadRadius: 3,
                                        blurRadius: 6,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: ListTile(
                                    onTap: (){
                                      setState(() {
                                        secilenId = sonuc.data[index].swimmerId;
                                        secilenAd = sonuc.data[index].swimmerNameSurname;
                                        secilenTakim = sonuc.data[index].swimmerTeam;
                                        secilenYas = sonuc.data[index].swimmerAge.toString();
                                        secilenDTarihi = (DateTime.now().year - sonuc.data[index].swimmerAge).toString();
                                      });
                                      Navigator.pop(context);
                                    },
                                    trailing: Icon(Icons.arrow_forward_ios,color: Color(0xFF29B6F6),),
                                    leading: Container(
                                      alignment: Alignment.center,
                                      height: 40,
                                      width: 40,
                                      child: Text(
                                        sonuc.data[index].swimmerAge.toString(),
                                      ),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFF29B6F6),
                                      ),
                                    ),
                                    title: Text(
                                        sonuc.data[index].swimmerNameSurname),
                                    subtitle:
                                        Text(sonuc.data[index].swimmerTeam),
                                  ),
                                );
                              },
                            );
                          } else {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text("Kayıtlı kullanıcı yok",style: TextStyle(fontSize: 20),),
                                RaisedButton(
                                  color: Color(0xFF29B6F6),
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(Icons.arrow_back,color: Colors.white,),
                                      Text("Geri git",style: TextStyle(color: Colors.white),),
                                    ],
                                  ),
                                  padding: EdgeInsets.all(20),
                                  elevation: 5,
                                ),
                              ],
                            );
                          }
                        } else {
                          return CircularProgressIndicator();
                        }
                      },
                    ),
                  ),
                ),
              );
        });
  }

  Future<bool> _showNewSwimmerDialog() {
    return showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  content: Column(
                    children: <Widget>[
                      SizedBox(height: 15),
                      _customTextField("Ad Soyad", Icon(Icons.text_format),
                          TextInputType.text),
                      SizedBox(height: 15),
                      _customTextField("Yaş", Icon(Icons.chrome_reader_mode),
                          TextInputType.number),
                      SizedBox(height: 15),
                      _customTextField(
                          "Takım", Icon(Icons.group), TextInputType.text),
                      Container(
                        height: kontrol == 0 ? 60 : 0,
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Lütfen tüm alanları eksiksiz doldurun !",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10)),
                      )
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
                        if (yeniAdSoyad == "" || yeniYas == 0 || yeniTakim == "") {
                          setState(() {
                            kontrol = 0;
                          });
                        } else {
                          _formSubmit();
                          Navigator.pop(context);
                        }
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
            },
          );
        });
  }

  _formSubmit() async {
    final _userModel = Provider.of<UserModel>(context, listen: false);
    Swimmer swimmer = Swimmer(
        swimmerId: rnd.nextInt(9999),
        swimmerAge: yeniYas,
        swimmerNameSurname: yeniAdSoyad,
        swimmerTeam: yeniTakim);
    bool sonuc = await _userModel.saveSwimmer(swimmer, _userModel.user);
    if (sonuc == true) {
      sonSonuc = sonuc;
      _showSnackBar();
    }
  }

  _showSnackBar() {
    if (sonSonuc != false) {
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
  }

  _showSaveSnackBar() {
    if (sonSonuc != false) {
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
              "Bilgiler başarıyla kaydedildi!",
              style: mLabelStyle,
            ),
          ],
        ),
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }
    else{
      final snackBar = SnackBar(
        duration: Duration(seconds: 7),
        backgroundColor: Colors.redAccent,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.close,
              color: Colors.white,
            ),
            Text(
              snackBarMessage,
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
                      Text(
                        secilenAd,
                        style: TextStyle(
                            color: Color(0xFF0288D1),
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.group, color: Color(0xFF0288D1), size: 25),
                      SizedBox(width: 5),
                      Text(
                        secilenTakim,
                        style: TextStyle(
                            color: Color(0xFF0288D1),
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
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
                      Icon(Icons.chrome_reader_mode,
                          color: Color(0xFF0288D1), size: 25),
                      SizedBox(width: 5),
                      Text(
                        secilenYas,
                        style: TextStyle(
                            color: Color(0xFF0288D1),
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.date_range,
                          color: Color(0xFF0288D1), size: 25),
                      SizedBox(width: 5),
                      Text(
                        secilenDTarihi,
                        style: TextStyle(
                            color: Color(0xFF0288D1),
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 20),
            height: 1,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey,
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: DropdownButton(
                  elevation: 10,
                  dropdownColor: Colors.grey.shade300,
                  value: _value,
                  isExpanded: true,
                  style: TextStyle(
                    color: Color(0xFF0288D1),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  hint: Text("Stil Seç"),
                  items: _values.map((String value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Row(
                        children: <Widget>[
                          Text(value),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (String value){
                    setState(() {
                      _value = value;
                      stil = _value;
                    });
                  },
                ),
              ),
              SizedBox(height: 10),
              TextField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.straighten),
                  labelText: "Mesafe (m)",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF29B6F6))),
                  labelStyle: TextStyle(color: Color(0xFF0288D1)),
                ),
                style: TextStyle(
                  color: Color(0xFF0288D1),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                onChanged: (dynamic girilen) {
                  int deger = int.parse(girilen);
                  mesafe = deger;
                },
              ),
              SizedBox(height: 10),
              TextField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.timer),
                  labelText: "Süre (sn)",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF29B6F6))),
                  labelStyle: TextStyle(color: Color(0xFF0288D1)),
                ),
                style: TextStyle(
                  color: Color(0xFF0288D1),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                onSubmitted: (dynamic girilen) {
                  int deger = int.parse(girilen);
                  sure = deger;
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

   kaydet() async{
    if(secilenAd == "Ad Soyad"){
      sonSonuc = false;
      snackBarMessage = "Lütfen önce sporcu seçin!";
      _showSaveSnackBar();
    }
    else if(mesafe == null || mesafe == 0){
      sonSonuc = false;
      snackBarMessage = "Lütfen 'Mesafe' alanını doldurunuz!";
      _showSaveSnackBar();
    }
    else if(sure == null || sure == 0){
      sonSonuc = false;
      snackBarMessage = "Lütfen 'Süre' alanını doldurunuz!";
      _showSaveSnackBar();
    }
    else if(secilenAd != "Ad Soyad"){
      int queue = rnd.nextInt(2000);
      final _userModel = Provider.of<UserModel>(context, listen: false);
      Swimmer swimmer = Swimmer(
        mesafe: mesafe,
        styleTime: sure,
        swimmerId: secilenId,
      );
      await _userModel.setSwimmerDistance(stil, swimmer, _userModel.user, mesafe);
      bool sonuc = await _userModel.setSwimmerStyle(stil, swimmer, _userModel.user, queue, mesafe);
      if (sonuc == true) {
        sonSonuc = sonuc;
        _showSaveSnackBar();
      }
    }
  }
}
