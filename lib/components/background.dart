import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF27335A),
    );
  }
}

//  @override
//  Widget build(BuildContext context) {
//    Size size = MediaQuery.of(context).size;
//    return Container(
//      alignment: Alignment.bottomCenter,
//      height: size.height,
//      width: double.infinity,
//      margin: EdgeInsets.only(top:50),
//      child: Stack(
//        children: <Widget>[
//          Positioned(
//            child: Image.asset(
//            "assets/icons/white chart-logo@2x.png",
//            width: size.width * 0.7,
//          ),
//          ),
//          child
//        ],
//
////        color: Color.fromARGB(00, 39, 51, 106),
//      ),
//    );
//  }
//}

//class Background extends StatelessWidget {
//  final Widget child;
//  const Background({
//    Key key,
//    @required this.child,
//  }) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    Size size = MediaQuery.of(context).size;
//    return Container(
//      height: size.height,
//      width: double.infinity,
//      color: Color.fromARGB(255, 39, 51, 106),
//    );
//  }
//}
