import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoach/screens/home/add/start/waitingScreen.dart';

class TrainingAddPage extends StatefulWidget {
  @override
  _TrainingAddPageState createState() => _TrainingAddPageState();
}

class _TrainingAddPageState extends State<TrainingAddPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<dynamic> tekrarList = new List();
  List<dynamic> mesafeList = new List();
  List<dynamic> antrenmanAdiList = new List();
  List<dynamic> antrenmanAciklamasiList = new List();
  List<dynamic> sureList = new List();
  int i = 0;
  dynamic mesafeToplam = 0;
  int sureToplam = 0;
  int sayac = 0;
  int dinlenmeSuresi = 0;

  @override
  void initState() {
    super.initState();
    tekrarList.add(1);
    mesafeList.add(100);
    antrenmanAdiList.add("Antrenman Adı");
    antrenmanAciklamasiList.add("Antrenman Açıklaması");
    sureList.add(60);
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
            "Antrenman Ekle",
            style: TextStyle(
              color: Color(0xFF0288D1),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0),
          child: Container(
            height: 56,
            child: FlatButton(// Color(0xFF0288D1)
              color: Color(0xFF0288D1),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => WaitingScreen(tekrarList,mesafeList,antrenmanAdiList,antrenmanAciklamasiList,sureList)));
              },
              child: Text(
                "Başlat !",
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
              _setInformation(),
              _setMainTraining(),
            ],
          ),
        ),
      ),
    );
  }
  String mesafeHesapla(){
    mesafeToplam = 0;
    for(var x in mesafeList){
      mesafeToplam = mesafeToplam + x;
    }
    return mesafeToplam.toString();
  }
  String sureHesapla(){
    sureToplam = 0;
    for(var x in sureList){
      sureToplam = sureToplam + x;
    }
    return sureToplam.toString();
  }

  Widget _setInformation() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(Icons.straighten, color: Color(0xFF0288D1), size: 33),
              Text(
                "Mesafe",
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontFamily: "Circular",
                    fontWeight: FontWeight.w400),
              ),
              Text(
                mesafeHesapla() + " m",
                style: TextStyle(
                    color: Color(0xFF0288D1),
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(Icons.timer, color: Color(0xFF0288D1), size: 30),
              Text(
                "Zaman",
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                sureHesapla() + " sn",
                style: TextStyle(
                    color: Color(0xFF0288D1),
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(Icons.pool, color: Color(0xFF0288D1), size: 30),
              Text("Havuz Uzunluğu",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                      fontWeight: FontWeight.w400)),
              SizedBox(
                width: 50,
                child: TextField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    labelText: "m",
                    labelStyle: TextStyle(color: Color(0xFF0288D1)),
                  ),
                  style: TextStyle(
                    color: Color(0xFF0288D1),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            height: 1,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget _customCard(int index) {
    return Card(
      color: Color(0xFF29B6F6),
      child: ListTile(
        leading: Column(
          children: <Widget>[
            Text(
              tekrarList[i].toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "X",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              mesafeList[i].toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        title: Text(
            antrenmanAdiList[i].toString(),
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: "Open-Sans",
                fontWeight: FontWeight.bold)),
        subtitle: Text(
            antrenmanAciklamasiList[i].toString() + "\n\n Süre: @${sureList[i].toString()}",
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: "Open-Sans",
                fontWeight: FontWeight.w500)),
        trailing: IconButton(
            icon: Icon(
              Icons.border_color,
              color: Colors.white,
            ),
            onPressed: () {
              i = index;
              _showDetailDialog(i);
            }),
      ),
    );
  }

  Widget _customTextField(String labelText, Icon icon, TextInputType type, int yer) {
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
        if(labelText == "Tekrar"){
          int deger = int.parse(girilen);
          tekrarList[yer] = deger;
        }
        if(labelText == "Mesafe (m)"){
          int deger = int.parse(girilen);
          mesafeList[yer] = deger;
        }
        if(labelText == "Antrenman Adı"){
          antrenmanAdiList[yer] = girilen;
        }
        if(labelText == "Antrenman Açıklaması"){
          antrenmanAciklamasiList[yer] = girilen;
        }
        if(labelText == "Süre (sn)"){
          int deger = int.parse(girilen);
          sureList[yer] = deger;
        }
      },
    );
  }

  Future<bool> _showDetailDialog(int i) {
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
                  _customTextField("Tekrar", Icon(Icons.refresh), TextInputType.number, i),
                  SizedBox(height: 15),
                  _customTextField("Mesafe (m)", Icon(Icons.straighten), TextInputType.number, i),
                  SizedBox(height: 15),
                  _customTextField("Antrenman Adı", Icon(Icons.text_rotation_none), TextInputType.text, i),
                  SizedBox(height: 15),
                  _customTextField("Antrenman Açıklaması", Icon(Icons.textsms), TextInputType.text, i),
                  SizedBox(height: 15),
                  _customTextField("Süre (sn)", Icon(Icons.timer), TextInputType.number, i),
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

  Widget _setMainTraining() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          SizedBox(height: 5),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(8.0),
            itemCount: sayac+1,
            itemBuilder: (context, index) {
              i = index;
              return _customCard(index);
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                color: Colors.red.shade500,
                padding: EdgeInsets.symmetric(horizontal: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Container(
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    if (sayac > 0) {
                      sayac--;
                      tekrarList.removeLast();
                      mesafeList.removeLast();
                      antrenmanAdiList.removeLast();
                      antrenmanAciklamasiList.removeLast();
                      sureList.removeLast();
                    }
                  });
                },
              ),
              FlatButton(
                color: Color(0xFF03A9F4),
                padding: EdgeInsets.symmetric(horizontal: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Container(
                  child: Icon(
                    Icons.add_circle,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    sayac++;
                    tekrarList.add(1);
                    mesafeList.add(100);
                    antrenmanAdiList.add("Antrenman Adı");
                    antrenmanAciklamasiList.add("Antrenman Açıklaması");
                    sureList.add(60);
                  });
                },
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            height: 1,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
