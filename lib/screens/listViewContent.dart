import 'package:flutter/material.dart';
import 'package:yao_app/screens/products/productPage.dart';

class ListViewContentSP500 extends StatelessWidget {
  const ListViewContentSP500({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true, //just set this property
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      children: <Widget>[
        Card(
          child: ListTile(
            title: Text('S&P 500'),
          ),
          color: Color(0xFFE0E2EA),
        ),
        Card(
          child: Column(
            children: <Widget>[
              Container(
                  child: ListTile(
                title: Text('Suggest Status'),
                subtitle: (Text('Sell')),
              )),
              ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: const Text(
                      'Go To Broker',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    color: Color(0xFF27B8A9),
                    onPressed: () {},
                  ),
                ],
              )
            ],
          ),
          color: Color(0xFFE0E2EA),
        ),
        Card(
          child: ListTile(
            title: Text('S&P 500'),
          ),
          color: Color(0xFFE0E2EA),
        ),
      ],
    );
  }
}

class ListViewContentSP500Lock extends StatelessWidget {
  const ListViewContentSP500Lock({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true, //just set this property
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      children: <Widget>[
        Card(
          child: ListTile(
            title: Text('S&P 500'),
          ),
          color: Color(0xFFE0E2EA),
        ),
        Card(
          child: Column(
            children: <Widget>[
              Container(
                  child: ListTile(
                title: Text('Suggest Status'),
                subtitle: (Text('Sell')),
              )),
              ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: const Text(
                      'Unlock to check the new status',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    color: Color(0xFF274E6A),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ProductPage(title: 'Products')),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
          color: Color(0xFFE0E2EA),
        ),
      ],
    );
  }
}

class ListViewContentBitcoinLock extends StatelessWidget {
  const ListViewContentBitcoinLock({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true, //just set this property
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      children: <Widget>[
        Card(
          child: ListTile(
            title: Text('Bitcoin'),
          ),
          color: Color(0xFFE0E2EA),
        ),
        Card(
          child: Column(
            children: <Widget>[
              Container(
                  child: ListTile(
                title: Text('Suggest Status'),
                subtitle: (Text('Sell')),
              )),
              ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: const Text(
                      'Unlock to check the new status',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    color: Color(0xFF274E6A),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ProductPage(title: 'Products')),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
          color: Color(0xFFE0E2EA),
        ),
      ],
    );
  }
}

class ListViewContentBitcoin extends StatelessWidget {
  const ListViewContentBitcoin({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true, //just set this property
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      children: <Widget>[
        Card(
          child: ListTile(
            title: Text('Bitcoin'),
          ),
          color: Color(0xFFE0E2EA),
        ),
        Card(
          child: Column(
            children: <Widget>[
              Container(
                  child: ListTile(
                title: Text('Suggest Status'),
                subtitle: (Text('Sell')),
              )),
              ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: const Text(
                      'Go To Broker',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    color: Color(0xFF27B8A9),
                    onPressed: () {},
                  ),
                ],
              )
            ],
          ),
          color: Color(0xFFE0E2EA),
        ),
        Card(
          child: ListTile(
            title: Text('Bitcoin'),
          ),
          color: Color(0xFFE0E2EA),
        ),
      ],
    );
  }
}
