import 'package:flutter/material.dart';
import 'package:yao_app/screens/feedback.dart';
import 'package:yao_app/screens/aboutUs.dart';
import 'package:yao_app/screens/notificationPage.dart';
import 'package:yao_app/screens/newsLetter.dart';

class SideBar extends StatelessWidget {
  final double _sideBarWidth = 170;
  final double _rightPadding = 28;
  final double _headerHeight = 99.5;
  final double _iconSize = 32;
  final double _notificationTopPadding = 32.5;
  final double _listTileInnerPadding = 16;
  final double _fontSize = 16;
  final double _lineDistance = 23;
  final double _contactUsTopPadding = 580.1;

  final int _borderColor = 0xffCBCED7;
  final int _fontColor = 0xff27335A;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: _sideBarWidth,
        child: Drawer(
            child: Stack(alignment: Alignment.center, children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: Image.asset('assets/images/sidebar.png', fit: BoxFit.none),
          ),
          ListView(padding: EdgeInsets.zero, children: <Widget>[
            Container(
              height: _headerHeight,
              child: DrawerHeader(
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: Color(_borderColor), width: 1))),
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                child: IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: _rightPadding),
                  iconSize: _iconSize,
                ),
              ),
            ),
            SizedBox(
              height: _notificationTopPadding + _listTileInnerPadding,
              child: ListTile(
                contentPadding: EdgeInsets.only(
                  top: _notificationTopPadding - _listTileInnerPadding,
                  right: _rightPadding,
                ),
                title: Text(
                  'Notification',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: _fontSize,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                      color: Color(_fontColor)),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return NotificationPage();
                  }));
                },
              ),
            ),
            SizedBox(
              height: _lineDistance + _listTileInnerPadding,
              child: ListTile(
                contentPadding: EdgeInsets.only(
                    top: _lineDistance - _listTileInnerPadding,
                    right: _rightPadding),
                title: Text(
                  'Newsletter',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: _fontSize,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                      color: Color(_fontColor)),
                ),
                // add router for news letter page
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return NewsLetter();
                  }));
                },
              ),
            ),
            SizedBox(
              height: _lineDistance + _listTileInnerPadding,
              child: ListTile(
                contentPadding: EdgeInsets.only(
                    top: _lineDistance - _listTileInnerPadding,
                    right: _rightPadding),
                title: Text(
                  'About Us',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: _fontSize,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                      color: Color(_fontColor)),
                ),
                // todo: add router for about us page
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AboutUs();
                  }));
                },
              ),
            ),
            SizedBox(
              height: _lineDistance + _listTileInnerPadding,
              child: ListTile(
                contentPadding: EdgeInsets.only(
                    top: _lineDistance - _listTileInnerPadding,
                    right: _rightPadding),
                title: Text(
                  'Feedback',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: _fontSize,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                      color: Color(_fontColor)),
                ),
                // todo: add router for feedback page
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return FeedbackPage();
                  }));
                },
              ),
            ),
          ]),
          Positioned(
              top: _contactUsTopPadding,
              child: InkWell(
                // todo: add router for contact us
                onTap: () {},
                child: Image.asset('assets/images/contact_us.png'),
              )),
        ])));
  }
}
