import 'package:flutter/material.dart';

class AccountMembershipPage extends StatefulWidget {
  AccountMembershipPageState createState() => AccountMembershipPageState();
}

class AccountMembershipPageState extends State<AccountMembershipPage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;

    int radioVal1 = -1;
    int radioVal2 = -1;

    void _handleRadioValSP500(int value) {
      setState(() {
        radioVal1 = value;
      });
    }

    void _handleRadioValBitcoin(int value) {
      setState(() {
        radioVal1 = value;
      });
    }

    void _handleRadioValPro(int value) {
      setState(() {
        radioVal1 = value;
      });
    }

    void _handleRadioValSemi(int value) {
      setState(() {
        radioVal2 = value;
      });
    }

    void _handleRadioValMonthly(int value) {
      setState(() {
        radioVal2 = value;
      });
    }

    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            "Memberships",
          ),
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Product",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                "Change or cancel plans at any time",
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      new Radio(
                        activeColor: Colors.black,
                        value: 0,
                        groupValue: radioVal1,
                        onChanged: _handleRadioValSP500,
                      ),
                      new Text("SP500 Algorithmic Trading Strategy"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      new Radio(
                          value: 1,
                          groupValue: radioVal1,
                          onChanged: _handleRadioValBitcoin),
                      new Text("Bitcoin Algorithmic Trading Strategy"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      new Radio(
                          value: 2,
                          groupValue: radioVal1,
                          onChanged: _handleRadioValPro),
                      new Text("SP500 & Bitcoin Membership Pro"),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15),
              Text(
                "Subscription Period",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      new Radio(
                          value: 0,
                          groupValue: radioVal2,
                          onChanged: _handleRadioValSemi),
                      new Text("Semi-annually "),
                      new Text(
                        "Save \$120 annually",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      new Radio(
                          value: 1,
                          groupValue: radioVal2,
                          onChanged: _handleRadioValMonthly),
                      new Text("Monthly "),
                      new Text(
                        "Save \$60 annually",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15),
              Text(
                "Payment",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              new SizedBox(
                width: width,
                child: RaisedButton(
                  child: Text("Save Updates"),
                  onPressed: null,
                ),
              ),
              new SizedBox(
                width: width,
                child: RaisedButton(
                  child: Text("Unsubscribe"),
                  onPressed: null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
