import 'package:flutter/material.dart';

class FeedbackDialog extends StatelessWidget {
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            color: Colors.white,
            width: 341,
            height: 371,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 40),
                Text(
                  "Thank you for your feedback!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(4280759130)
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  child: Text(
                    "We will get back to you through email",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(4280759130)
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Image.asset('assets/images/group1791.png', width:150.87),
                SizedBox(height: 40),
                Center(
                  child: Container(
                    width: 158,
                    height: 46,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: Color(4280759130),
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Got it',
                        style: TextStyle(
                          fontSize: 14,
                        ),),
                    ),
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
