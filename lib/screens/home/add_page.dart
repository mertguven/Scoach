import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:scoach/screens/home/add/enterDegrees.dart';
import 'package:scoach/screens/home/add/trainingAdd.dart';

class HomeAdd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: <Widget>[
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => TrainingAddPage()));
              },
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Stack(
                  overflow: Overflow.visible,
                  alignment: Alignment.center,
                  children: <Widget>[
                    Opacity(
                      opacity: 1,
                      child: Image.asset(
                        "assets/images/swimmer.jpg",
                        height: MediaQuery.of(context).size.height / 2.5,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      "Antrenman Hazırla",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => EnterDegreesPage()));
                },
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Stack(
                  overflow: Overflow.visible,
                  alignment: Alignment.center,
                  children: <Widget>[
                    Opacity(
                      opacity: 1,
                      child: Image.asset(
                        "assets/images/derece.jpg",
                        height: MediaQuery.of(context).size.height / 2.5,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      "Dereceleri Gir",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
