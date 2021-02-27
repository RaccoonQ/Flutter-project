import 'package:flutter/material.dart';
import 'agreement_text.dart';

enum SingingCharacter { lafayette, jefferson }

class Agreement extends StatefulWidget {
  @override
  _AgreementState createState() => _AgreementState();
}

class _AgreementState extends State<Agreement> {
  @override
  Widget build(BuildContext context) {
    String agreementText = AgreementText.successMessage;
    print(SingingCharacter.jefferson.runtimeType);

    // singleRadio.

    var singleChildScrollView = SingleChildScrollView(
        child: Column(
      children: <Widget>[
        Container(
            child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(agreementText,
                    style: TextStyle(color: Colors.white, fontSize: 12.0)))),
        Container(
            child: ButtonBar(
          alignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              color: Color(0XFF27B8A9),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              child: Text(
                'Agree and Continue',
                style: TextStyle(
                    color: Colors.white, fontSize: 15.0), //TextStyle),
              ),
              onPressed: () {/** */},
            )
          ],
        )),
        Container(
          child: FlatButton(
            child: Text('Disagree and go back',
                style: TextStyle(color: Colors.white, fontSize: 15.0)),
            onPressed: () {},
          ),
        ),
      ],
    ));
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0xFF27335A),
            title: (Text("Term and Agreement"))),
        body: singleChildScrollView,
        backgroundColor: Color(0xFF27335A));
  }
}
