import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoach/screens/home/add/start/trainingComplete.dart';

// ignore: must_be_immutable
class TrainingStartPage extends StatefulWidget {
  List<dynamic> tekrarList = new List();
  List<dynamic> mesafeList = new List();
  List<dynamic> antrenmanAdiList = new List();
  List<dynamic> antrenmanAciklamasiList = new List();
  List<dynamic> sureList = new List();

  TrainingStartPage(this.tekrarList, this.mesafeList, this.antrenmanAdiList,
      this.antrenmanAciklamasiList, this.sureList);

  @override
  _TrainingStartPageState createState() => _TrainingStartPageState();
}

class _TrainingStartPageState extends State<TrainingStartPage>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  int sayac = 0;

  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) { // widget.sureList[sayac]
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: sayac <= widget.tekrarList.length ? widget.sureList[sayac] : 0));

    controller.forward();
    animation = Tween<double>(begin: 0,end: 1).animate(controller);
    animation.addStatusListener(_animasyonBittiMi);
    return GestureDetector(
      onTap: _durdurBaslat,
      child: Scaffold(
        backgroundColor: Colors.white10,
        body: SafeArea(
          child: AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                return Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        color: Color(0xFF4FC3F7),
                        width: animation.value *
                            MediaQuery.of(context).size.width,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Align(
                              alignment: FractionalOffset.center,
                              child: Stack(
                                overflow: Overflow.visible,
                                children: <Widget>[
                                  IconButton(
                                      alignment: Alignment.topLeft,
                                      icon: Icon(Icons.close,color: Colors.white,),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      }),
                                  Align(
                                    alignment: FractionalOffset.center,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          widget.antrenmanAdiList[sayac].toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 20.0,

                                              color: Colors.white),
                                        ),
                                        Text(
                                          widget.antrenmanAciklamasiList[sayac].toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          "${widget.tekrarList[sayac]} Tekrar",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          "Toplam Süre: ${widget.sureList[sayac]} sn",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          timerString,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 112.0,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          "Durdurmak veya devam ettirmek için ekrana dokunun.",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }

  _animasyonBittiMi(status){
    if(status == AnimationStatus.completed){
      if(sayac < widget.tekrarList.length - 1){
        setState(() {
          sayac++;
        });
      }
      else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TrainingIsCompletePage()));
      }
      animation.removeStatusListener(_animasyonBittiMi);
    }
  }

  _durdurBaslat() {
    if (controller.isAnimating){
      controller.stop();
    }
    else{
      controller.forward();
    }
  }
}
