import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoach/screens/login_page.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentIndex = 0;
  PageController controller;

  @override
  void initState() {
    controller = new PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
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
            PageView.builder(
              itemCount: 5,
              controller: controller,
              onPageChanged: (val) {
                setState(() {
                  currentIndex = val;
                });
              },
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Eleman(index);
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 4.0),
                      height: currentIndex == 0 ? 12.0 : 6.0,
                      width: currentIndex == 0 ? 12.0 : 6.0,
                      decoration: BoxDecoration(
                        color: currentIndex == 0 ? Colors.white : Colors.black38,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 4.0),
                      height: currentIndex == 1 ? 12.0 : 6.0,
                      width: currentIndex == 1 ? 12.0 : 6.0,
                      decoration: BoxDecoration(
                        color: currentIndex == 1 ? Colors.white : Colors.black38,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 4.0),
                      height: currentIndex == 2 ? 12.0 : 6.0,
                      width: currentIndex == 2 ? 12.0 : 6.0,
                      decoration: BoxDecoration(
                        color: currentIndex == 2 ? Colors.white : Colors.black38,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 4.0),
                      height: currentIndex == 3 ? 12.0 : 6.0,
                      width: currentIndex == 3 ? 12.0 : 6.0,
                      decoration: BoxDecoration(
                        color: currentIndex == 3 ? Colors.white : Colors.black38,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 4.0),
                      height: currentIndex == 4 ? 12.0 : 6.0,
                      width: currentIndex == 4 ? 12.0 : 6.0,
                      decoration: BoxDecoration(
                        color: currentIndex == 4 ? Colors.white : Colors.black38,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: currentIndex != 4 ? Padding(
        padding: EdgeInsets.symmetric(horizontal: 0),
        child: Container(
          color: Color(0xFF4FC3F7),
          height: 56,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FlatButton(
                color: Color(0xFF4FC3F7),
                padding: EdgeInsets.symmetric(horizontal: 70),
                onPressed: () {
                  setState(() {
                    currentIndex = 4;
                    controller.animateToPage(currentIndex, duration: Duration(milliseconds: 500), curve: Curves.easeInToLinear);
                  });
                },
                child: Text(
                  "Geç",
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
                ),
              ),
              FlatButton(
                color: Color(0xFF4FC3F7),
                padding: EdgeInsets.symmetric(horizontal: 70),
                onPressed: () {
                  if(currentIndex <= 3){
                    setState(() {
                      currentIndex++;
                      controller.animateToPage(currentIndex, duration: Duration(milliseconds: 500), curve: Curves.easeInToLinear);
                    });
                  }
                },
                child: Text(
                  "İleri",
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ) : Padding(
        padding: EdgeInsets.symmetric(horizontal: 0),
        child: Container(
          color: Color(0xFF4FC3F7),
          height: 56,
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30)),
            ),
            color: Colors.white,
            onPressed: () {
              Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => LoginPage()));
            },
            child: Text(
              "Hadi Başlayalım!",
              style: TextStyle(letterSpacing: 1,color: Color(0xFF29B6F6),fontWeight: FontWeight.bold,fontSize: 20),
            ),
          ),
        ),
      )
    );
  }
}

// ignore: must_be_immutable
class Eleman extends StatelessWidget {
  int index;

  Eleman(this.index);

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    if (index == 0) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Sporcuların antrenmanlarını daha kolay takip edebilecekleri şekilde ekleyebilirsiniz.",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 20),
          Container(
            child: Image.asset(
              "assets/images/antrenmanekle.png",
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width / 2,
            ),
          )
        ],
      );
    }
    else if (index == 1) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Sporcuların antrenmanlarını daha kolay takip edebilecekleri şekilde ekleyebilirsiniz.",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 20),
          Container(
            child: Image.asset(
              "assets/images/antrenmanbaslat.png",
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width / 2,
            ),
          )
        ],
      );
    }
    else if (index == 2) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Sporcuların antrenmanlarını daha kolay takip edebilecekleri şekilde ekleyebilirsiniz.",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 20),
          Container(
            child: Image.asset(
              "assets/images/derecekayit.png",
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width / 2,
            ),
          )
        ],
      );
    }
    else if (index == 3) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Sporcuların antrenmanlarını daha kolay takip edebilecekleri şekilde ekleyebilirsiniz.",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 20),
          Container(
            child: Image.asset(
              "assets/images/tablo.png",
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width / 2,
            ),
          )
        ],
      );
    }
    else if (index == 4) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Sporcuların antrenmanlarını daha kolay takip edebilecekleri şekilde ekleyebilirsiniz.",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 20),
          Container(
            child: Image.asset(
              "assets/images/profil.png",
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width / 2,
            ),
          )
        ],
      );
    }
  }
}
