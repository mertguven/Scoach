import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:scoach/model/swimmer.dart';
import 'package:scoach/viewmodel/user_model.dart';

class HomeGraph extends StatefulWidget {

  @override
  _HomeGraphState createState() => _HomeGraphState();
}

class _HomeGraphState extends State<HomeGraph> {

  String secilenAd = "Ad Soyad";
  String secilenTakim = "Takım";
  String secilenDTarihi = "Doğum Tarihi";
  String secilenYas = "Yaş";
  int secilenId = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                child: Container(
                  height: 90,
                  width: 80,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Image.asset("assets/images/s.png"),
                      Text("Serbest",style: TextStyle(color: Colors.white,fontSize: 16,letterSpacing: 1.5,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.cyanAccent.shade400,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 6,
                          offset: Offset(
                              0, 3), // changes position of shadow
                        ),
                      ],
                    borderRadius: BorderRadius.circular(20)
                  ),
                ),
              ),
              GestureDetector(
                child: Container(
                  height: 90,
                  width: 80,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Image.asset("assets/images/k.png"),
                      Text("Kelebek",style: TextStyle(color: Colors.white,fontSize: 16,letterSpacing: 1.5,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.cyanAccent.shade400,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 6,
                          offset: Offset(
                              0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20)
                  ),
                ),
              ),
              GestureDetector(
                child: Container(
                  height: 90,
                  width: 80,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Image.asset("assets/images/s.png"),
                      Text("Sırt",style: TextStyle(color: Colors.white,fontSize: 16,letterSpacing: 1.5,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.cyanAccent.shade400,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 6,
                          offset: Offset(
                              0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20)
                  ),
                ),
              ),
              GestureDetector(
                child: Container(
                  height: 90,
                  width: 80,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Image.asset("assets/images/k.png"),
                      Text("Kurbağa",style: TextStyle(color: Colors.white,fontSize: 16,letterSpacing: 1.5,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.cyanAccent.shade400,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 6,
                          offset: Offset(
                              0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20)
                  ),
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
                    color: Colors.grey.withOpacity(0.6),
                    spreadRadius: 3,
                    blurRadius: 6,
                    offset: Offset(
                        0, 3), // changes position of shadow
                  ),
                ]
            ),
            child: Column(
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
              ],
            ),
          ),
        ],
      ),
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
}
