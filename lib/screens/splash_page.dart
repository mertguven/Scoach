import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Opacity(
              opacity: 0.5,
              child: Image.asset('assets/images/bg.png'),
            ),
            Shimmer.fromColors(
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Scoach",
                  style: TextStyle(
                    fontSize: 90,
                    fontFamily: 'Pacifico',
                    shadows: <Shadow>[
                      Shadow(
                        blurRadius: 18,
                        color: Colors.black87,
                        offset: Offset.fromDirection(120, 12),
                      ),
                    ],
                  ),
                ),
              ),
              baseColor: Color(0xFF0288D1),
              highlightColor: Color(0xFF4FC3F7),
            ),
          ],
        ),
      ),
    );
  }
}
