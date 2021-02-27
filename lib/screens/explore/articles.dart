import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:yao_app/screens/explore/articlePage.dart';
import 'package:yao_app/models/post.dart';

class Articles extends StatefulWidget {
  ArticlesState createState() => ArticlesState();
}

class ArticlesState extends State<Articles> {
  String thumbnail = "";

  Future<List<Post>> getData() async {
    List<Post> list;
    String link = "https://yaonology.com/wp-json/wp/v2/posts";
    var res = await http.get(link);
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      var rest = data as List;
      list = rest.map<Post>((json) => Post.fromJson(json)).toList();
    } else {
      return null;
    }

    String link2 = "https://yaonology.com/wp-json/wp/v2/media?parent=";
    for (var i = 0; i < list.length; i++) {
      String thumbnailpic = "";
      String thumbnailId = list[i].id.toString();
      var res2 = await http.get(link2 + thumbnailId);
      if (res2.statusCode == 200) {
        var data2 = json.decode(res2.body);
        var rest2 = data2 as List;
        thumbnailpic = rest2[0]["guid"]["rendered"];
      }
      list[i].thumbnail = thumbnailpic;
    }

    return list;
  }

  Widget listViewWidget(List<Post> post) {
    // var screenSize = MediaQuery.of(context).size;
    // // var width = screenSize.width;
    // // var height = screenSize.height;
    return Container(
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, position) {
            return Card(
              child: SizedBox(
                height: 140,
                child: ListTile(
                  contentPadding: EdgeInsets.all(10),
                  title: Text(
                    'Yaonology',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.blue[500],
                    ),
                  ),
                  subtitle: Text(
                    '${post[position].title}',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                  trailing: Container(
                      width: 150,
                      child: Image.network('${post[position].thumbnail}')),
                  isThreeLine: true,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ArticlePage(
                              '${post[position].content}',
                              '${post[position].link}')),
                    );
                  }, //_onTapItem(context, post[position]),
                ),
              ),
            );
          }),
    );
  }

/*
  void _onTapItem(BuildContext context, Post post) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => NewsDetails(post, widget.title)));
  }
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            return snapshot.data != null
                ? listViewWidget(snapshot.data)
                : Center(child: CircularProgressIndicator());
          }),
    );
  }
}
