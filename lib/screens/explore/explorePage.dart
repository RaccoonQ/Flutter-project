import 'package:flutter/material.dart';
import 'package:yao_app/screens/explore/articles.dart';
import 'package:yao_app/screens/explore/videosPage.dart';
import 'package:yao_app/templates/sidebar_template.dart';

class ExplorePage extends StatefulWidget {
  ExplorePageState createState() => ExplorePageState();
}

class ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          endDrawer: SideBar(),
          appBar: AppBar(
            backgroundColor: Color(4280759130),
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Text('Articles'),
                ),
                Tab(
                  child: Text('Videos'),
                ),
                Tab(
                  child: Text('Saved'),
                ),
              ],
            ),
            title: Text(
              'Explore',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Stack(
            children: <Widget>[
              TabBarView(
                children: [
                  Articles(),
                  Videos(),
                  Text("Saved"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
