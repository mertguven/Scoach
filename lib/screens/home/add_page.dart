import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:scoach/screens/home/add/enterDegrees.dart';
import 'package:scoach/screens/home/add/trainingAdd.dart';

class HomeAdd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height -80;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.topCenter,
          color: Colors.white,
          height: height,
          width: width,
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TrainingAddPage()));
                },
                child: Card(
                  margin: EdgeInsets.symmetric(horizontal: 0),
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Image.asset(
                        "assets/images/swimmer.jpg",
                        height: height /2,
                        width: width,
                        fit: BoxFit.cover,
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
                  margin: EdgeInsets.symmetric(horizontal: 0),
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Image.asset(
                        "assets/images/dereceler.jpg",
                        filterQuality: FilterQuality.low,
                        height: height /2,
                        width: width,
                        fit: BoxFit.cover,
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
      ),
    );
  }
}
