import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yao_app/templates/login_template.dart';
import 'package:yao_app/services/auth.dart';

class ResetPassword extends StatefulWidget {
  final Function toggleView;
  ResetPassword({this.toggleView});

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final myController = TextEditingController();
  final AuthService _auth = AuthService();

  String email = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return LoginTemplate(
      Text('Reset Password'),
      Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 350,
              child: TextFormField(
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    hintText: 'Account Email',
                    hintStyle: TextStyle(
                      color: Colors.grey[300],
                    )),
                controller: myController,
                style: TextStyle(color: Colors.grey[300]),
              ),
            ),
            SizedBox(
              height: 55,
            ),
            SizedBox(
              width: 350,
              height: 40,
              child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.teal[300],
                  shape: RoundedRectangleBorder(
                    side: BorderSide.none,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    'Send Reset Link',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () async {
                    email = myController.text;

                    //sends email to user
                    dynamic result = await _auth.sendPasswordResetEmail(email);
                    if (result == null) {
                      error = "Invalid Email";
                    } else {
                      error = "Please check your email to reset your password";
                    }

                    //pop-up message
                    Widget okButton =
                        FlatButton(child: Text('OK'), onPressed: () {});

                    AlertDialog alert = AlertDialog(
                      content: Text(error),
                      actions: <Widget>[
                        okButton,
                      ],
                    );

                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        });
                  }
                  /*
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/icons/reset_button.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                */
                  ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 250,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Forgot your account email? ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[300],
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  InkWell(
                    child: Text(
                      'Contact Us',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[300],
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Stack(
                              overflow: Overflow.visible,
                              children: <Widget>[
                                Form(
                                  child: Container(
                                    height: 200,
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.all(8),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              hintText: 'Email',
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                                hintText: 'Message'),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8),
                                          child: RaisedButton(
                                            child: Text('Send Message'),
                                            onPressed: () {},
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            //content: Text('contact us at ...'),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

/*
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        body: Container(
            alignment: Alignment.center,
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/reset_background.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Center(
                child: Column(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      'Reset Password',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )),
                SizedBox(height: 50),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [],
                  ),
                  margin: EdgeInsets.only(left: 20),
                  width: size.width * 0.9,
                  height: size.height * 0.06,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Account Email',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  width: size.width * 0.9,
                  height: size.height * 0.06,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    color: Colors.teal[400],
                    child: Text(
                      'Send Reset Link',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: null,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    'Forgot your account email? Contact Us',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ))),
      ),
    );
  }
}
*/
