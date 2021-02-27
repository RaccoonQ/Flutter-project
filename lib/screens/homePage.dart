import 'package:flutter/material.dart';
import 'package:yao_app/templates/sidebar_template.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:yao_app/screens/listViewContent.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final _storage = FlutterSecureStorage();
  Map<String, String> _map; // declare for readAll() function

  @override
  void initState() {
    super.initState();

    _readAll(); // read user data
    // trigger showAlertDialog after 3 seconds
    Timer(Duration(seconds: 3), _showAlertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        endDrawer: SideBar(),
        appBar: AppBar(
          centerTitle: true,
          title: Align(
            alignment: Alignment.topLeft,
            child: Text('Today'),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        extendBodyBehindAppBar: true,
        body: Container(
          decoration: BoxDecoration(
            color: new Color(0xFFE8703A),
            image: DecorationImage(
              image: AssetImage('assets/images/home-1-6.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Stack(children: <Widget>[
            Container(
                child: DefaultTabController(
                    length: 2,
                    child: Column(
                      children: <Widget>[
                        Container(
                            constraints:
                                BoxConstraints.expand(height: 200, width: 350),
                            child: TabBar(
                              labelColor: Color(0xFF011A70),
                              labelStyle: TextStyle(
                                fontSize: 20,
                              ),
                              labelPadding: EdgeInsets.only(left: 15, top: 110),
                              unselectedLabelColor:
                                  Color(0xFF011A70).withOpacity(0.55),
                              indicatorWeight: 5,
                              indicatorPadding:
                                  EdgeInsets.only(left: 15, bottom: 15),
                              indicatorSize: TabBarIndicatorSize.tab,
                              isScrollable: true,
                              tabs: <Widget>[
                                Tab(
                                    child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text('SP500'),
                                )),
                                Tab(
                                    child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text('Bitcoin'),
                                )),
                              ],
                            )),
                        Expanded(
                          flex: 1,
                          child: TabBarView(
                            children: <Widget>[
                              showListViewContentSPY(_map),
                              showListViewContentBitcoin(_map),
                            ],
                          ),
                        ),
                      ],
                    ))),
          ]),
        ));
  }

  Future _readAll() async {
    final all = await _storage.readAll();
    var currentID = await _storage.read(key: "currentCustomer");

    setState(() {
      _map = Map.fromEntries(all.entries.expand((e) => [
            if (e.key == 'currentCustomer')
              MapEntry(e.key, e.value)
            else
              MapEntry(e.key.substring(currentID.length), e.value)
          ]));
      return _map;
    });
  }

  // Show Alert Dialog
  Future<void> _showAlertDialog() async {
    // Button 1
    Widget cancelButton = FlatButton(
      child: Text("Not now"),
      // Trigger showAlertDialog again 10 secs after pressing the button
      onPressed: () {
        Navigator.of(context, rootNavigator: true)
            .pop(Timer(Duration(seconds: 10), _showAlertDialog));
      },
    );

    // Button 2
    Widget continueButton = FlatButton(
      child: Text("Allow"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Turn on Notification"),
      content: Text("Turn on notifications to receive trading alerts on time"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // Show the dialog
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

showListViewContentSPY(_map) {
  if (_map != null) {
    if ((_map['product'] == 'SPY Membership' && _map['status'] == 'active') ||
        (_map['product'] == 'Premium Membership' &&
            _map['status'] == 'active')) {
      return ListViewContentSP500();
    } else {
      return ListViewContentSP500Lock();
    }
  } else {
    return ListViewContentSP500Lock();
  }
}

showListViewContentBitcoin(_map) {
  if (_map != null) {
    if ((_map['product'] == 'Bitcoin Membership' &&
            _map['status'] == 'active') ||
        (_map['product'] == 'Premium Membership' &&
            _map['status'] == 'active')) {
      return ListViewContentBitcoin();
    } else {
      return ListViewContentBitcoinLock();
    }
  } else {
    return ListViewContentBitcoinLock();
  }
}

getDictItem(_item) async {
  Map mapAll = Map();

  for (var i = 0; i < _item.length; i++) {
    mapAll[_item[i].key] = _item[i].value;
  }

  var custProduct = "";
  var custStatus = "";
  if (mapAll.length != 0) {
    custProduct = mapAll['product']
        .replaceAll("[", "")
        .replaceAll("]", "")
        .replaceAll(" ", "");
    custStatus = mapAll['status']
        .replaceAll("[", "")
        .replaceAll("]", "")
        .replaceAll(" ", "");

    List<String> listProduct = custProduct.split(",");
    List<String> listStatus = custStatus.split(",");

    Map mapProdcut = Map();
    for (var i = 0; i < listProduct.length; i++) {
      mapProdcut[listProduct[i]] = listStatus[i];
    }
    return mapProdcut;
  } else {
    return null;
  }
}
