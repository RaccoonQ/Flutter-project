import 'package:flutter/material.dart';
import 'package:yao_app/components/CustomedIntroSlider.dart';
import 'package:yao_app/components/sizeConfig.dart';

class GetStarted2 extends StatefulWidget {
  GetStarted2({Key key}) : super(key: key);

  @override
  GetStarted2State createState() => new GetStarted2State();
}

class GetStarted2State extends State<GetStarted2> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: new CustomedIntroSlider(),
    );
  }
}
