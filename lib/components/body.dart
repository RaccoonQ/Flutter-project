import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
// import 'package:YNG1/components/background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xFF27335A),
        body: Container(
            child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 100),
              //put another thing here
              child: Stack(
                children: <Widget>[
                  Positioned(
                    child: Image.asset(
                      "assets/icons/white chart-logo@2x.png",
                      width: size.width * 0.7,
                    ),
                  ),
                ],
              ),
            ),
          ],
        )));
  }
}
