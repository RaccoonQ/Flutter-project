import 'package:flutter/material.dart';
// import 'package:yao_app/components/body.dart';
// import 'package:yao_app/screens/reset_password.dart';
// import 'package:yao_app/templates/login_template.dart';
import 'screens/getStarted1.dart';
// import 'screens/get_started_2.dart';
// import 'screens/login.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF27335A),
      ),
      checkerboardOffscreenLayers: true,
      debugShowCheckedModeBanner: false,
      home: GetStarted1(),
    );
  }
}
