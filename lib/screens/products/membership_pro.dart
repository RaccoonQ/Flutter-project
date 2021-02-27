import 'package:flutter/material.dart';
import 'package:yao_app/screens/products/payment.dart';

class MembershipProCheckout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;
    var product;
    var price;

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: false,
        title: Text('Checkout'),
        backgroundColor: Color(4280759130),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        alignment: Alignment.center,
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Colors.grey[200],
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Yaonology Membership',
                    style: TextStyle(
                      color: Colors.blue[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'SP500 & Bitcoin',
                    style: TextStyle(
                      color: Colors.blue[900],
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        ButtonTheme(
                          height: height / 6,
                          minWidth: width / 3,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            color: Colors.indigo[900],
                            textColor: Colors.white,
                            padding: EdgeInsets.all(5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  r'$' '41.99/m',
                                  style: TextStyle(
                                    color: Colors.teal[400],
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'SEMI-ANNUALLY',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            onPressed: () {
                              product = "Membership - Semi-annually";
                              price = 41.99;
                            },
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        ButtonTheme(
                          height: height / 6,
                          minWidth: width / 3,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            color: Colors.white,
                            textColor: Colors.teal[400],
                            padding: EdgeInsets.all(5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  r'$' '49.99/m',
                                  style: TextStyle(
                                    color: Colors.teal[400],
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'MONTHLY',
                                  style: TextStyle(
                                    color: Colors.teal[400],
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            highlightColor: Colors.white,
                            onPressed: () {
                              product = "Membership - Monthly";
                              price = 49.99;
                            },
                          ),
                        ),
                      ]),
                  SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.all(3.0),
                    padding: const EdgeInsets.all(3.0),
                    width: width / 5,
                    height: height / 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      color: Colors.teal[400],
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Value Kit',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              '* Change or cancel plans at any time. All plans include 30-day free trials.',
              style: TextStyle(
                color: Colors.blue[900],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[100],
        child: Container(
          height: height / 9,
          width: width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: width / 3,
              ),
              ButtonTheme(
                minWidth: width / 3,
                height: height / 15,
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.teal[300],
                  shape: RoundedRectangleBorder(
                    side: BorderSide.none,
                    borderRadius: BorderRadius.circular(70),
                  ),
                  child: Text(
                    'Checkout',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Payment(product, price)),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
class MembershipPro extends StatefulWidget {
  @override
  _MembershipProState createState() => _MembershipProState();
}

class _MembershipProState extends State<MembershipPro> {
  @override
  Widget build(BuildContext context) {
    return ProductPageTemplate(
      'membershippro',
      Container(),
    );
    //'assets/images/home - 1-2.png');
  }
}
*/
