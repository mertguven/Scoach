import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrainingAddPage extends StatefulWidget {
  @override
  _TrainingAddPageState createState() => _TrainingAddPageState();
}

class _TrainingAddPageState extends State<TrainingAddPage> {
  final _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int sayac = 1;

  /*
                  FlatButton(
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                  ),
                  child: Container(
                    child: Icon(
                      Icons.done,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {},
                )
   */

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
            child: FlatButton(
              color: Colors.lightGreen,
                onPressed: (){},
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
              Icon(Icons.straighten, color: Colors.amber, size: 33),
              Text(
                "Mesafe",
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                "50",
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
              Icon(Icons.timer, color: Colors.amber, size: 30),
              Text(
                "Zaman",
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                "30",
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
              Icon(Icons.pool, color: Colors.amber, size: 30),
              Text("Havuz Boyu",
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

  Widget _customCard() {
    return Card(
      color: Color(0xFF29B6F6),
      child: ListTile(
        leading: Column(
          children: <Widget>[
            Text(
              "1",
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
              "100",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        title: Text("Antrenman Adı",
            style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold)),
        subtitle: Text("Açıklaması",
            style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w400)),
        trailing: IconButton(
            icon: Icon(
              Icons.border_color,
              color: Colors.white,
            ),
            onPressed: () {}),
      ),
    );
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
            itemCount: sayac,
            itemBuilder: (context, index) {
              return _customCard();
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
                    if (sayac > 1) {
                      sayac--;
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
/*Widget _informations() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: ListTile(
                leading: Icon(Icons.straighten,color: Colors.amber,size: 36),
                title: Center(child: Text("Mesafe",style: TextStyle(color: Colors.black87,fontSize: 20,fontWeight: FontWeight.w500))),
                subtitle: Center(child: Text("800 m",style: TextStyle(color: Color(0xFF0288D1),fontSize: 22,fontWeight: FontWeight.bold))),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: ListTile(
                leading: Icon(Icons.pool,color: Colors.brown,size: 36),
                title: Center(child: Text("Havuz Boyu",style: TextStyle(color: Colors.black87,fontSize: 20,fontWeight: FontWeight.w500))),
                subtitle: Center(child: Text("50 m",style: TextStyle(color: Color(0xFF0288D1),fontSize: 22,fontWeight: FontWeight.bold))),
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
              title: Center(child: Text("Zaman",style: TextStyle(color: Colors.black87,fontSize: 20,fontWeight: FontWeight.w500))),
              subtitle: Center(child: Text("3 dk",style: TextStyle(color: Color(0xFF0288D1),fontSize: 22,fontWeight: FontWeight.bold))),
            ),
          ),
        ),
      ],
    );
  }*/

/*
              SizedBox(
                width: 60,
                child: DropdownButton(
                  value: dropdownValue,
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: ['1', '2', '3', '4'].map(
                    (String value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    },
                  ).toList(),
                ),
              )

 */
}
