import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF27335A),
      child: Center(
        child: SpinKitChasingDots(
          color: Color(0xFF27B8A9),
          size: 50.0,
        ),
      ),
    );
  }
}
