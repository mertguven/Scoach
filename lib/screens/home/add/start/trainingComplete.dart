import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoach/screens/home_page.dart';

class TrainingIsCompletePage extends StatefulWidget {
  @override
  _TrainingIsCompletePageState createState() => _TrainingIsCompletePageState();
}

class _TrainingIsCompletePageState extends State<TrainingIsCompletePage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Icon(Icons.done,color: Color(0xFF0277BD),size: 50),
              SizedBox(height: 50),
              Text(
                "Antrenman Tamamlandı!",
                style: TextStyle(color: Color(0xFF0277BD),fontSize: 30),
              ),
              SizedBox(height: 100),
              RaisedButton(
                elevation: 7.0,
                padding: EdgeInsets.all(15),
                color: Color(0xFF0277BD),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Icon(
                      Icons.settings_backup_restore,
                      color: Colors.white,
                    ),
                    Text(
                      "Ana Sayfaya Dön",
                      style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 2,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 50),
              SizedBox(
                child: TextLiquidFill(
                  boxWidth: MediaQuery.of(context).size.width,
                  loadDuration: Duration(seconds: 3),
                  waveDuration: Duration(seconds: 3),
                  waveColor: Color(0xFF0277BD),
                  text: "",
                  boxBackgroundColor: Colors.transparent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
