import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoach/screens/home/add/start/trainingComplete.dart';

class TrainingStartPage extends StatefulWidget {
  List<dynamic> tekrarList = new List();
  List<dynamic> mesafeList = new List();
  List<dynamic> antrenmanAdiList = new List();
  List<dynamic> antrenmanAciklamasiList = new List();
  List<dynamic> sureList = new List();
  int dinlenmeSuresi = 0;

  TrainingStartPage(this.tekrarList, this.mesafeList, this.antrenmanAdiList,
      this.antrenmanAciklamasiList, this.sureList, this.dinlenmeSuresi);

  @override
  _TrainingStartPageState createState() => _TrainingStartPageState();
}

class _TrainingStartPageState extends State<TrainingStartPage>
    with TickerProviderStateMixin {
  AnimationController controller;

  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }
  int sayac = 0;
  String bittiMi = "Bitmedi !!!!!!!!!";

  final _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    controller.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) { //widget.sureList[sayac]
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: sayac <= widget.tekrarList.length ? widget.sureList[sayac] : 0));


    return GestureDetector(
      onTap: _durdurBaslat,
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white10,
        body: SafeArea(
          child: AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                return Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    IconButton(
                        alignment: Alignment.topLeft,
                        icon: Icon(Icons.close,color: Colors.white,),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        color: Color(0xFF4FC3F7),
                        width: controller.value *
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
                                  Align(
                                    alignment: FractionalOffset.center,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          bittiMi,
                                        ),
                                        Text(
                                          widget.antrenmanAdiList[sayac].toString(),
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          widget.antrenmanAciklamasiList[sayac].toString(),
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          timerString,
                                          style: TextStyle(
                                              fontSize: 112.0,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          "Başlatmak, durdurmak veya devam ettirmek için ekrana dokunun.",
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

  _durdurBaslat() {
    if (controller.isAnimating){
      controller.stop();
    }
    else{
      controller.reverse(
          from: controller.value == 0.0 ? 1.0 : controller.value);
    }
    controller.addStatusListener((AnimationStatus status) {
      if(status == AnimationStatus.completed){
        if(sayac < widget.tekrarList.length - 1){
          setState(() {
            sayac++;
          });
        }
        else{
          controller.stop();
          Navigator.push(context, CupertinoPageRoute(builder: (context) => TrainingIsCompletePage()));
        }
      }
    }
    );
  }
}
