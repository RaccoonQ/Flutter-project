import 'package:flutter/material.dart';
import 'package:yao_app/screens/products/bitcoin.dart';
import 'package:yao_app/screens/products/membership_pro.dart';
import 'package:yao_app/screens/products/sp500.dart';
import 'package:yao_app/templates/sidebar_template.dart';

class ProductPage extends StatefulWidget {
  ProductPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;

    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        endDrawer: SideBar(),
        appBar: AppBar(
          centerTitle: false,
          title: Text(widget.title),
          backgroundColor: Color(4280759130),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Stack(
            children: <Widget>[
              ListView(
                children: <Widget>[
                  FlatButton(
                    child: Image.asset(
                      'assets/images/product_sp500.png',
                      fit: BoxFit.cover,
                      height: height / 4,
                      width: width - 40,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SP500()),
                      );
                    },
                  ),
                  FlatButton(
                    child: Image.asset(
                      'assets/images/product_bitcoin.png',
                      fit: BoxFit.cover,
                      width: width - 40,
                      height: height / 4,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Bitcoin()),
                      );
                    },
                  ),
                  SizedBox(
                    height: 30,
                    child: Text(
                      '--------------------- or ---------------------',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  FlatButton(
                    child: Image.asset(
                      'assets/images/product_membership_pro.png',
                      fit: BoxFit.cover,
                      width: width - 40,
                      height: height / 4,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MembershipProCheckout()),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
