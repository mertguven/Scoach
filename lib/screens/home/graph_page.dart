import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:scoach/model/swimmer.dart';
import 'package:scoach/services/firestore_db_service.dart';
import 'package:scoach/viewmodel/user_model.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class HomeGraph extends StatefulWidget {
  @override
  _HomeGraphState createState() => _HomeGraphState();
}

class _HomeGraphState extends State<HomeGraph> {
  String secilenZaman = "";
  int secilenSure = 0;

  String secilenAd = "Ad Soyad";
  String secilenTakim = "Takım";
  String secilenDTarihi = "Doğum Tarihi";
  String secilenYas = "Yaş";
  int secilenId = 0;
  static var chartdisplay;
  var veri;
  String _value = "";
  List<String> _values = new List<String>();

  @override
  void initState() {
    _values.addAll(["2014", "2015", "2016", "2017", "2018", "2019", "2020"]);
    _value = _values.elementAt(0);
    veri = [
      Addcharts("1 Haz", 0),
      Addcharts("2 Haz", 0),
      Addcharts("3 Haz", 0),
      Addcharts("4 Haz", 0),
      Addcharts("5 Haz", 0),
    ];
    _grafikGetir([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - 80;
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: <Widget>[
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
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () => _showSwimmerStyleDialog("Serbest"),
                  child: Container(
                    height: 90,
                    width: 80,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Image.asset("assets/images/s.png"),
                        Text(
                          "Serbest",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.cyanAccent.shade400,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 3,
                            blurRadius: 6,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                GestureDetector(
                  onTap: () => _showSwimmerStyleDialog("Kelebek"),
                  child: Container(
                    height: 90,
                    width: 80,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Image.asset("assets/images/k.png"),
                        Text(
                          "Kelebek",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.cyanAccent.shade400,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 3,
                            blurRadius: 6,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                GestureDetector(
                  onTap: () => _showSwimmerStyleDialog("Sırt"),
                  child: Container(
                    height: 90,
                    width: 80,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Image.asset("assets/images/s.png"),
                        Text(
                          "Sırt",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.cyanAccent.shade400,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 3,
                            blurRadius: 6,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                GestureDetector(
                  onTap: () => _showSwimmerStyleDialog("Kurbağa"),
                  child: Container(
                    height: 90,
                    width: 80,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Image.asset("assets/images/k.png"),
                        Text(
                          "Kurbağa",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.cyanAccent.shade400,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 3,
                            blurRadius: 6,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(20)),
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.shade300,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 6,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ]),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(Icons.person,
                              color: Color(0xFF0288D1), size: 25),
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
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.shade300,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.7),
                      spreadRadius: 3,
                      blurRadius: 6,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ]),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: DropdownButton(
                      elevation: 10,
                      dropdownColor: Colors.grey.shade300,
                      value: _value,
                      isExpanded: true,
                      iconEnabledColor: Color(0xFF0288D1),
                      style: TextStyle(
                        color: Color(0xFF0288D1),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      hint: Text("Yıl Seç"),
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
                      onChanged: (String value) {
                        setState(() {
                          _value = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () {},
                        elevation: 3,
                        color: Color(0xFF0288D1),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.equalizer,color: Colors.white),
                            SizedBox(width: 5),
                            Text(
                              "Grafik",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 15),
                      RaisedButton(
                        onPressed: () {},
                        elevation: 3,
                        color: Color(0xFF0288D1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Icon(Icons.table_chart,color: Colors.white),
                            SizedBox(width: 5),
                            Text(
                              "Tablo",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 15),
                      RaisedButton(
                        onPressed: () {},
                        elevation: 3,
                        color: Color(0xFF0288D1),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.timeline,color: Colors.white),
                            SizedBox(width: 5),
                            Text(
                              "Sparkline",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: height / 2,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.shade300,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.7),
                      spreadRadius: 3,
                      blurRadius: 6,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ]),
              child: chartdisplay,
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _showSwimmerStyleDialog(String style) {
    FirestoreDBService db = FirestoreDBService();
    final _userModel = Provider.of<UserModel>(context, listen: false);
    Swimmer swimmer = Swimmer(
      swimmerId: secilenId,
    );
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
                  future: db.getSelectedStyle(_userModel.user, swimmer, style),
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
                                onTap: () => _veriCek(db, _userModel, sonuc,
                                    swimmer, style, index),
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xFF29B6F6),
                                ),
                                leading: Icon(
                                  Icons.straighten,
                                  color: Color(0xFF29B6F6),
                                ),
                                title: Text(
                                    sonuc.data[index].mesafe.toString() +
                                        " metre"),
                              ),
                            );
                          },
                        );
                      } else {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Kayıtlı veri yok",
                              style: TextStyle(fontSize: 20),
                            ),
                            RaisedButton(
                              color: Color(0xFF29B6F6),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "Geri git",
                                    style: TextStyle(color: Colors.white),
                                  ),
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
                                onTap: () {
                                  setState(() {
                                    secilenId = sonuc.data[index].swimmerId;
                                    secilenAd =
                                        sonuc.data[index].swimmerNameSurname;
                                    secilenTakim =
                                        sonuc.data[index].swimmerTeam;
                                    secilenYas =
                                        sonuc.data[index].swimmerAge.toString();
                                    secilenDTarihi = (DateTime.now().year -
                                            sonuc.data[index].swimmerAge)
                                        .toString();
                                  });
                                  Navigator.pop(context);
                                },
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xFF29B6F6),
                                ),
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
                                title:
                                    Text(sonuc.data[index].swimmerNameSurname),
                                subtitle: Text(sonuc.data[index].swimmerTeam),
                              ),
                            );
                          },
                        );
                      } else {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Kayıtlı kullanıcı yok",
                              style: TextStyle(fontSize: 20),
                            ),
                            RaisedButton(
                              color: Color(0xFF29B6F6),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "Geri git",
                                    style: TextStyle(color: Colors.white),
                                  ),
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

  _veriCek(
      FirestoreDBService db,
      UserModel userModel,
      AsyncSnapshot<List<Swimmer>> sonuc,
      Swimmer swimmer,
      String style,
      int index) async {
    List<Swimmer> deneme = await db.getSelectedInformation(
        userModel.user, swimmer, style, sonuc.data[index].mesafe);
    _grafikGetir(deneme);
    Navigator.pop(context);
  }

  _grafikGetir(List<Swimmer> deneme) {
    if (deneme.length < 5) {
      if (deneme.length == 4) {
        var data = [
          Addcharts("1", deneme[deneme.length - 4].styleTime),
          Addcharts("2", deneme[deneme.length - 3].styleTime),
          Addcharts("3", deneme[deneme.length - 2].styleTime),
          Addcharts("4", deneme[deneme.length - 1].styleTime),
        ];
        veri = data;
      } else if (deneme.length == 3) {
        var data = [
          Addcharts("1", deneme[deneme.length - 3].styleTime),
          Addcharts("2", deneme[deneme.length - 2].styleTime),
          Addcharts("3", deneme[deneme.length - 1].styleTime),
        ];
        veri = data;
      } else if (deneme.length == 2) {
        var data = [
          Addcharts("1", deneme[deneme.length - 2].styleTime),
          Addcharts("2", deneme[deneme.length - 1].styleTime),
        ];
        veri = data;
      }
    } else if (deneme.length >= 5) {
      var data = [
        Addcharts("1", deneme[deneme.length - 5].styleTime),
        Addcharts("2", deneme[deneme.length - 4].styleTime),
        Addcharts("3", deneme[deneme.length - 3].styleTime),
        Addcharts("4", deneme[deneme.length - 2].styleTime),
        Addcharts("5", deneme[deneme.length - 1].styleTime),
      ];
      veri = data;
    } else {
      var data = [
        Addcharts("1", 0),
        Addcharts("2", 0),
        Addcharts("3", 0),
        Addcharts("4", 0),
        Addcharts("5", 0),
      ];
      veri = data;
    }
    setState(() {
      var series = [
        charts.Series(
          domainFn: (Addcharts addcharts, _) => addcharts.clock,
          measureFn: (Addcharts addcharts, _) => addcharts.time,
          id: "Grafik",
          data: veri,
        ),
      ];
      chartdisplay = charts.BarChart(
        series,
        animationDuration: Duration(milliseconds: 1200),
      );
    });
  }
}

class Addcharts {
  final String clock;
  final time;

  Addcharts(this.clock, this.time);
}
