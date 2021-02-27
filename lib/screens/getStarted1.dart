import 'dart:async';
import 'package:flutter/material.dart';
import 'package:wp_json_api/wp_json_api.dart';
import 'package:yao_app/appFirebase.dart';
import 'getStarted2.dart';
import 'package:yao_app/components/sizeConfig.dart';
import 'package:yao_app/services/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetStarted1 extends StatefulWidget {
  @override
  GetStarted1State createState() => GetStarted1State();
}

class GetStarted1State extends State<GetStarted1> {
  final AuthService _auth = AuthService();

  startTime() async {
    var prefs = await SharedPreferences.getInstance();
    var isFirstTime = prefs.getBool("isFirstTime");
    var duration = new Duration(milliseconds: 3);

    if (isFirstTime != null && !isFirstTime) {
      // Not first time
      return new Timer(duration, navigationPageHome);
    } else {
      // First time
      prefs.setBool('isFirstTime', false);
      return new Timer(duration, navigationPageWel);
    }
  }

  void navigationPageHome() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => AppFirebase()));
  }

  void navigationPageWel() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => GetStarted2()));
  }

  @override
  void initState() {
    super.initState();
    WPJsonAPI.instance.initWith(baseUrl: "https://yaonology.com");
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: GestureDetector(
        onTap: () async {
          await _auth.signOut();
          await startTime();
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            ConstrainedBox(
              child: Image.asset(
                'assets/images/get_started_1.png',
                fit: BoxFit.fill,
              ),
              constraints: BoxConstraints.expand(),
            ),
            Positioned(
              top: 118 * SizeConfig.vRatio,
              width: SizeConfig.width,
              child: Padding(
                padding: EdgeInsets.only(left: 39 * SizeConfig.hRatio),
                child: Text(
                  'We do algorithm\nYou get signal',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0xFF011A70),
                    fontSize: 25 * SizeConfig.tRatio,
                    fontFamily: 'SfProText',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 36 * SizeConfig.vRatio,
              child: Image.asset(
                "assets/icons/white chart-logo.png",
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
