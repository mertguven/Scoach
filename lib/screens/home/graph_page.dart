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
  int presentation = 0;
  List<Swimmer> veriler;

  @override
  void initState() {
    veri = [
      Addcharts("1 Haz", 0),
      Addcharts("2 Haz", 0),
      Addcharts("3 Haz", 0),
      Addcharts("4 Haz", 0),
      Addcharts("5 Haz", 0),
    ];
    veriler = [
      Swimmer(created: "-", style: "-", distance: 0, styleTime: 0),
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
                        Image.asset("assets/images/se.png",height: 40,width: 40),
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
                        Image.asset("assets/images/ke.png",height: 40,width: 40),
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
                        Image.asset("assets/images/sı.png",height: 40,width: 40),
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
                        Image.asset("assets/images/ku.png",height: 40,width: 40),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () {
                          setState(() {
                            presentation = 0;
                          });
                        },
                        elevation: 3,
                        color: Color(0xFF0288D1),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.equalizer, color: Colors.white),
                            SizedBox(width: 15),
                            Text(
                              "Grafik",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 50),
                      RaisedButton(
                        onPressed: () {
                          setState(() {
                            presentation = 1;
                          });
                        },
                        elevation: 3,
                        color: Color(0xFF0288D1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Icon(Icons.table_chart, color: Colors.white),
                            SizedBox(width: 15),
                            Text(
                              "Tablo",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Not: Grafik, kaydedilen son 5 sonucu gösterir. \n Tablo, kaydedilen bütün sonuçları gösterir.",
                    style: TextStyle(
                      color: Color(0xFF0288D1),
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                      shadows: [
                        Shadow(
                          color: Colors.grey,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
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
              child: presentation == 0 ? chartdisplay : _table(veriler),
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
                                onTap: () {
                                  _veriCek(db, _userModel, sonuc, swimmer,
                                      style, index);
                                },
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
    List<Swimmer> gelenVeri = await db.getSelectedInformation(
        userModel.user, swimmer, style, sonuc.data[index].mesafe);
    _grafikGetir(gelenVeri);
    veriler = gelenVeri;
    Navigator.pop(context);
  }

  Widget _table(List<Swimmer> veriler) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: AlwaysScrollableScrollPhysics(),
        child: DataTable(
          columnSpacing: 50,
          columns: [
            DataColumn(label: Text('Tarih')),
            DataColumn(label: Text('Stil')),
            DataColumn(label: Text('Mesafe')),
            DataColumn(label: Text('Süre')),
          ],
          rows: veriler
              .map(
                (veri) => DataRow(cells: [
                  DataCell(Text(veri.created.toString())),
                  DataCell(Text(veri.style.toString())),
                  DataCell(Text(veri.distance.toString() + " m")),
                  DataCell(Text(veri.styleTime.toString() + "sn")),
                ]),
              )
              .toList(),
        ),
      ),
    );
  }

  _grafikGetir(List<Swimmer> deneme) {
    if (deneme.length < 5) {
      if (deneme.length == 4) {
        var data = [
          Addcharts(deneme[deneme.length - 4].created,
              deneme[deneme.length - 4].styleTime),
          Addcharts(deneme[deneme.length - 3].created,
              deneme[deneme.length - 3].styleTime),
          Addcharts(deneme[deneme.length - 2].created,
              deneme[deneme.length - 2].styleTime),
          Addcharts(deneme[deneme.length - 1].created,
              deneme[deneme.length - 1].styleTime),
        ];
        veri = data;
      } else if (deneme.length == 3) {
        var data = [
          Addcharts(deneme[deneme.length - 3].created,
              deneme[deneme.length - 3].styleTime),
          Addcharts(deneme[deneme.length - 2].created,
              deneme[deneme.length - 2].styleTime),
          Addcharts(deneme[deneme.length - 1].created,
              deneme[deneme.length - 1].styleTime),
        ];
        veri = data;
      } else if (deneme.length == 2) {
        var data = [
          Addcharts(deneme[deneme.length - 2].created,
              deneme[deneme.length - 2].styleTime),
          Addcharts(deneme[deneme.length - 1].created,
              deneme[deneme.length - 1].styleTime),
        ];
        veri = data;
      } else if (deneme.length == 1) {
        var data = [
          Addcharts(deneme[deneme.length - 1].created,
              deneme[deneme.length - 1].styleTime),
        ];
        veri = data;
      }
    } else if (deneme.length >= 5) {
      var data = [
        Addcharts(deneme[deneme.length - 5].created,
            deneme[deneme.length - 5].styleTime),
        Addcharts(deneme[deneme.length - 4].created,
            deneme[deneme.length - 4].styleTime),
        Addcharts(deneme[deneme.length - 3].created,
            deneme[deneme.length - 3].styleTime),
        Addcharts(deneme[deneme.length - 2].created,
            deneme[deneme.length - 2].styleTime),
        Addcharts(deneme[deneme.length - 1].created,
            deneme[deneme.length - 1].styleTime),
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
            labelAccessorFn: (Addcharts addcharts, _) =>
                '${addcharts.time.toString()} sn'),
      ];
      chartdisplay = charts.BarChart(
        series,
        animationDuration: Duration(milliseconds: 1200),
        barRendererDecorator: new charts.BarLabelDecorator<String>(),
      );
    });
  }
}

class Addcharts {
  final String clock;
  final time;

  Addcharts(this.clock, this.time);
}
