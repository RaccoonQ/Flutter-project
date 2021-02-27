import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class NewsLetter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewsLetterState();
}

class _NewsLetterState extends State<NewsLetter> {
  final formKey = GlobalKey<FormState>();
  String _email;

  final double _appBarTotalHeight = 119;
  final double _titleLeftPadding = 36;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;

    return MaterialApp(
        home: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
            _appBarTotalHeight - MediaQuery.of(context).padding.top),
        child: AppBar(
          centerTitle: false,
          title: Text(
            'Newsletter',
            style: TextStyle(fontFamily: 'SfProText', fontSize: 25),
          ),
          backgroundColor: Color(4280759130),
          actions: [
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
          titleSpacing: _titleLeftPadding,
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Text('Subscribe to our newsletter about the latest blogs',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xff7481AC),
                    fontSize: 13,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w300)),
            padding: EdgeInsets.only(top: 40),
          ),
          TextFormField(
            textAlign: TextAlign.center,
            keyboardType: TextInputType.emailAddress,
            decoration: new InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                hintText: "Your Email"),
            // validator: (val) => !EmailValidator.validate(val, true)
            //     ? 'Not a valid email.'
            //     : null,
            onSaved: (val) => _email = val,
          ),
          ButtonTheme(
            minWidth: width / 3,
            height: height / 20,
            child: RaisedButton(
              textColor: Colors.white,
              color: Colors.teal[300],
              shape: RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Text(
                'Subscribe',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.normal),
              ),
              onPressed: () {
                //unsubscribe
              },
            ),
          ),
        ],
      ),
    ));
  }
}
