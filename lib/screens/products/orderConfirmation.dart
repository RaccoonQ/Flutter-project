import 'package:flutter/material.dart';
import 'package:yao_app/components/sizeConfig.dart';
import 'package:yao_app/templates/sidebar_template.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:yao_app/screens/homePage.dart';

class OrderConfirmation extends StatefulWidget {
  @override
  OrderConfirmationState createState() => OrderConfirmationState();
}

class OrderConfirmationState extends State<OrderConfirmation> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var height = screenSize.height;
    var width = screenSize.width;
    final SizedBox sizeBoxSpacing = SizedBox(height: height / 40);
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      endDrawer: SideBar(),
      backgroundColor: Color(0xFF27335A),
      // key: _scaffoldKey,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/thank_you_order.png"),
            fit: BoxFit.contain,
          ),
        ),
        child: FlatButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          padding: EdgeInsets.all(0),
          onPressed: () {
            // _showSnackBar();
          },
          child: Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                Container(
                    child: SlidingUpPanel(
                  minHeight: height / 4,
                  maxHeight: height / 4,
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                  panel: Container(
                    padding: EdgeInsets.only(top: 20),
                  ),
                  collapsed: Column(
                    children: <Widget>[
                      sizeBoxSpacing,
                      sizeBoxSpacing,
                      Container(
                          child: ButtonTheme(
                        minWidth: width / 15,
                        height: height / 15,
                        child: RaisedButton(
                          textColor: Colors.grey[300],
                          color: Colors.grey[300],
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Colors.teal[300],
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(70),
                          ),
                          child: Text(
                            'View Order',
                            style: TextStyle(
                              color: Colors.teal[300],
                            ),
                          ),
                          onPressed: () {},
                        ),
                      )),
                      sizeBoxSpacing,
                      Container(
                          child: ButtonTheme(
                        minWidth: width / 15,
                        height: height / 15,
                        child: RaisedButton(
                          textColor: Colors.white,
                          color: Colors.teal[300],
                          shape: RoundedRectangleBorder(
                            side: BorderSide.none,
                            borderRadius: BorderRadius.circular(70),
                          ),
                          child: Text(
                            'Go To Home Page',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                            );
                          },
                        ),
                      ))
                    ],
                  ),
                  body: Container(),
                )),
                Container(),
              ])),
        ),
      ),
    );
  }
}
