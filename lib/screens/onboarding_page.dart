import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentIndex = 0;
  PageController controller;

  Widget _buildPageIndicator(bool isCurrentPage){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 12.0 : 6.0,
      width: isCurrentPage ? 12.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Color(0xFF0288D1) : Colors.grey,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
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
                currentIndex = val;
              },
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Eleman(index);
              },
            ),
          ],
        ),
      ),
      bottomSheet: currentIndex != 4 ?
      Container(
        margin: EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            GestureDetector(
              onTap: () {},
              child: Text("Geç"),
            ),
            
            GestureDetector(
              onTap: () {},
              child: Text("İleri"),
            ),
          ],
        ),
      ): Container(
        child: Text("data"),
      )
    );
  }
}

class Eleman extends StatelessWidget {
  int index;

  Eleman(this.index);

  @override
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
    } else if (index == 1) {
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
    } else if (index == 2) {
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
    } else if (index == 3) {
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
    } else if (index == 4) {
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
