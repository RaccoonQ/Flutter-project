import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AboutUs extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  final double _appBarTotalHeight = 119;
  final double _titleLeftPadding = 36;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
            _appBarTotalHeight - MediaQuery.of(context).padding.top),
        child: AppBar(
          centerTitle: false,
          title: Text(
            'About Us',
            style: TextStyle(fontFamily: 'SfProText', fontSize: 25),
          ),
          backgroundColor: Color(4280759130),
          actions: [
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
          titleSpacing: _titleLeftPadding,
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            child: Text('WHO WE ARE',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color(0xff7481AC),
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold)),
            padding: EdgeInsets.all(25),
          ),
          Container(
            margin: EdgeInsets.only(left: 30.0),
            child: Text(
                'We are a fintech startup founded in 2019, located at Waltham, MA. We provide algorithmic trading signals for consumers. By integrating economic data into our algorithm, we develop two algorithmic trading strategies for SP500 (SPY) and Bitcoin (BTCUSD), to support individual investors to trade stocks based on arithmetics. Yaonology is a company that believes in communication, time management, self-organization, problem-solving, analysis, and teamwork.',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color(0xff7481AC),
                    fontSize: 14,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.w500)),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Text('OUR MISSION',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color(0xff7481AC),
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold)),
            padding: EdgeInsets.all(25),
          ),
          Container(
            margin: EdgeInsets.only(left: 30.0),
            child: Text(
                'To empower individual investors to take control of their financial lives and be more confident with their strategies by utilizing backtesting.',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color(0xff7481AC),
                    fontSize: 14,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.w500)),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Text('OUR VISION',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color(0xff7481AC),
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold)),
            padding: EdgeInsets.all(25),
          ),
          Container(
            margin: EdgeInsets.only(left: 30.0),
            child: Text(
                'To be a reliable investment resource to the clients we serve by reducing psychological factors in decision-making.',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color(0xff7481AC),
                    fontSize: 14,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    ));
  }
}
