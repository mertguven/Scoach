import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoach/screens/home/add/start/trainingStart.dart';

// ignore: must_be_immutable
class WaitingScreen extends StatefulWidget {
  List<dynamic> tekrarList = new List();
  List<dynamic> mesafeList = new List();
  List<dynamic> antrenmanAdiList = new List();
  List<dynamic> antrenmanAciklamasiList = new List();
  List<dynamic> sureList = new List();

  WaitingScreen(this.tekrarList, this.mesafeList, this.antrenmanAdiList,
      this.antrenmanAciklamasiList, this.sureList);

  @override
  _WaitingScreenState createState() => _WaitingScreenState();
}

class _WaitingScreenState extends State<WaitingScreen>
    with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                child: SizedBox(
                  width: 250.0,
                  child: ScaleAnimatedTextKit(
                    onFinished: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TrainingStartPage(
                                  widget.tekrarList,
                                  widget.mesafeList,
                                  widget.antrenmanAdiList,
                                  widget.antrenmanAciklamasiList,
                                  widget.sureList)));
                    },
                    duration: Duration(milliseconds: 800),
                    isRepeatingAnimation: false,
                    text: [
                      "3",
                      "2",
                      "1",
                    ],
                    textStyle: TextStyle(
                        fontSize: 220.0,
                        color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                    alignment: AlignmentDirectional.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
