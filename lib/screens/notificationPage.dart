import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  /// Checks the state of notification button.
  /// If the button is on, change the color of the following 'On' text
  // todo: Implement the actual notification feature.
  bool notificationIsOn = false;

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
            'Notification',
            style: TextStyle(fontFamily: 'SfProText', fontSize: 25),
          ),
          backgroundColor: Color(4280759130),
          // toolbarHeight: _appBarTotalHeight - MediaQuery.of(context).padding.top,
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
        children: [
          Container(
            child: Text('Notifications include new signals and blogs.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xff7481AC),
                    fontSize: 13,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w300)),
            padding: EdgeInsets.only(top: 40),
          ),
          Container(
            child: Text(
              'We recommend you to turn on the notification.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xff7481AC),
                  fontSize: 13,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w300),
            ),
            padding: EdgeInsets.only(bottom: 24),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
                padding: EdgeInsets.only(right: 13),
                child: Text('Notification',
                    style: TextStyle(
                      fontFamily: 'MontSerrat',
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff7481AC),
                    ))),
            CupertinoSwitch(
              value: this.notificationIsOn,
              activeColor: Color(0xff27B8A9),
              onChanged: (value) {
                setState(() {
                  this.notificationIsOn = value;
                });
              },
            ),
            Container(
              child: Text(
                'On',
                style: TextStyle(
                  fontFamily: 'MontSerrat',
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: this.notificationIsOn
                      ? Color(0xff011A70)
                      : Color(0xff7481AC),
                ),
              ),
              padding: EdgeInsets.only(left: 13),
            ),
          ])
        ],
      ),
    ));
  }
}
