import 'package:flutter/material.dart';
import 'package:yao_app/screens/authenticate/sign_in.dart';
import 'package:yao_app/templates/sidebar_template.dart';
import 'package:yao_app/services/auth.dart';
import 'package:yao_app/screens/account/accountMembership.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AccountPage extends StatefulWidget {
  AccountPageState createState() => AccountPageState();
}

class AccountPageState extends State<AccountPage> {
  final AuthService _auth = new AuthService();
  final _storage = FlutterSecureStorage();
  Map<String, String> _map; // declare for readAll() function

  @override
  void initState() {
    super.initState();

    _readAll(); // read user data
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        endDrawer: SideBar(),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(4280759130),
          title: (_map == null || _map.isEmpty)
              ? Text("Hi")
              : Text(
                  "Hi, " + _map['userName'],
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
        ),
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/accountBg.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        SizedBox(height: 50),
                        renderMyMembershipHeader(_map),
                        SizedBox(
                          height: 30,
                        ),
                        renderCustomerInformation(_map),
                        SizedBox(
                          height: 30,
                        ),
                        renderManageSubscriptionButton(context),
                        SizedBox(
                          height: 30,
                        ),
                        renderReferAFriendBox(width),
                        SizedBox(
                          height: 20,
                        ),
                        renderLogOut(context, _auth),
                        SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
}

Widget renderMyMembershipHeader(Map<String, String> _map) {
  return Column(
    children: <Widget>[
      Text(
        "My Membership",
        style: TextStyle(
          color: Colors.blue[900],
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
      (_map == null || _map.isEmpty)
          ? Text("Your free trial ends on ")
          : Text(
              "Your free trial ends on " + _map['cancelDate'],
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 10,
              ),
            ),
    ],
  );
}

Widget renderCustomerInformation(Map<String, String> _map) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text('Prodcut'),
              (_map == null || _map.isEmpty) ? Text("") : Text(_map['product']),
            ],
          ),
          SizedBox(
            width: 150,
          ),
          Column(
            children: <Widget>[
              Text('Status'),
              (_map == null || _map.isEmpty) ? Text("") : Text(_map['status']),
            ],
          )
        ],
      ),
      SizedBox(
        height: 30,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text('Start Date'),
              (_map == null || _map.isEmpty) ? Text("") : Text(_map['startDate']),
            ],
          ),
          SizedBox(
            width: 150,
          ),
          Column(
            children: <Widget>[
              Text('End Date'),
              (_map == null || _map.isEmpty) ? Text("") : Text(_map['cancelDate']),
            ],
          )
        ],
      ),
    ],
  );
}

Widget renderManageSubscriptionButton(BuildContext context) {
  return ButtonTheme(
    minWidth: 80,
    height: 50,
    child: RaisedButton(
      child: Text("Manage my Subscription"),
      textColor: Colors.white,
      color: Colors.teal[400],
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(70),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AccountMembershipPage()),
        );
      },
    ),
  );
}

Widget renderReferAFriendBox(double width) {
  return SizedBox(
    width: width * 5 / 6,
    child: Container(
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        color: Colors.teal[400],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          renderReferAFriendHeader(),
          SizedBox(
            height: 10,
          ),
          getWhiteText("Your Refrral URL: "),
          SizedBox(
            height: 10,
          ),
          getWhiteText("Your Coupon Code to share: "),
          SizedBox(
            height: 10,
          ),
          getWhiteText("Share on social media:"),
          renderSocialMediaButtonRow(),
          SizedBox(
            height: 10,
          ),
          getWhiteText("Share via email:"),
        ],
      ),
    ),
  );
}

Widget renderReferAFriendHeader() {
  return Column(
    children: <Widget>[
      Align(
        alignment: Alignment.center,
        child: Text(
          "Refer A Friend",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Align(
        alignment: Alignment.center,
        child: Text(
          "________________________________",
          style: TextStyle(
            color: Colors.blue[900],
            fontSize: 10,
          ),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      getBlueText(
          "For each friend you invite, we will offer your 300pts that you can use to purchase any items from our Renology Store."),
    ],
  );
}

Widget renderSocialMediaButtonRow() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      socialButtons(),
      socialButtons(),
      socialButtons(),
      socialButtons(),
    ],
  );
}

Widget socialButtons() {
  return Container(
    width: 65,
    height: 45,
    child: RaisedButton(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      shape: CircleBorder(
          side: BorderSide(
        width: 3,
        color: Colors.white,
      )),
      onPressed: null,
    ),
  );
}

Widget renderLogOut(BuildContext context, AuthService _auth) {
  return ButtonTheme(
    minWidth: 80,
    height: 40,
    child: RaisedButton(
        child: Text("Log Out"),
        textColor: Colors.white,
        color: Colors.teal[400],
        shape: RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.circular(70),
        ),
        onPressed: () {
          _auth.signOut();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignIn()),
          );
        }),
  );
}

/// input a string, return a Text object with fontSize 10 and color Blue.
Widget getBlueText(text) {
  return Text(
    text,
    style: TextStyle(
      color: Colors.blue[800],
      fontSize: 10,
    ),
  );
}

/// input a string, return a Text object with fontSize 14, color White and
/// Bold weight.
Widget getWhiteText(text) {
  return Text(
    text,
    style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    ),
  );
}
