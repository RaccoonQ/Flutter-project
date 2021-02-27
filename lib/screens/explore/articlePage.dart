import 'dart:ui';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter/material.dart';
import 'package:yao_app/templates/sidebar_template.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
//import 'package:flutter_share/flutter_share.dart';

class ArticlePage extends StatelessWidget {
  final String html;
  final String url;

  ArticlePage(this.html, this.url);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var height = screenSize.height;
    var width = screenSize.width;

    //Future<void> share() async {
    //await FlutterShare.share(title: "Yaonology", linkUrl: url);
    //}

    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomPadding: false,
      endDrawer: SideBar(),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SlidingUpPanel(
        minHeight: height * 2 / 3,
        maxHeight: height * 9 / 10,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
        panel: Container(
          padding: EdgeInsets.only(top: 20),
          child: SingleChildScrollView(
            child: Html(
              data: html,
              padding: EdgeInsets.all(30),
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/articlebg.png"),
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
          ),
        ),
      ),
      floatingActionButton: Row(
        children: <Widget>[
          SizedBox(
            width: width / 10,
          ),
          FloatingActionButton(
            onPressed: null,
            child: Icon(Icons.bookmark),
            backgroundColor: Color(4280759130),
            heroTag: null,
          ),
          SizedBox(
            width: width / 30,
          ),
          FloatingActionButton(
            onPressed: null,
            child: Icon(Icons.send),
            backgroundColor: Color(4280759130),
            heroTag: null,
          ),
        ],
      ),
    );
  }
}
