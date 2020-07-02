import 'package:flutter/material.dart';

class HomeAdd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset('assets/images/logo.png'),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Card(
                child: Container(
                  child: Text("veri veri veri veri veri"),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
