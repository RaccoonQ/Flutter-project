// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yao_app/screens/authenticate/reset_password.dart';
import 'package:yao_app/screens/authenticate/register.dart';
import 'package:yao_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:yao_app/components/loading.dart';
import 'package:yao_app/components/sizeConfig.dart';
// import 'package:yao_app/screens/homePage.dart';
// import 'package:yao_app/screens/wrapper.dart';
import 'package:wp_json_api/wp_json_api.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  // final List result;

  SignIn({
    this.toggleView,
    // this.result
  });

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  FirebaseUser user;
  bool loading = false;
  bool _obscureText = true;

  // text field state
  String email = '';
  String password = '';
  String username = '';
  String error = '';

  @override
  void initState() {
    super.initState();
    WPJsonAPI.instance.initWith(baseUrl: "https://yaonology.com");
  }

  Widget build(BuildContext context) {
    SizeConfig().init(context);

  return  Material(
    child: loading
      ? Loading()
      : Container(
          color: Color(0xFF27335A),
          alignment: Alignment.topCenter,
          // margin: EdgeInsets.all(50),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              /// contents: logo, TextFormFields, images
              child: Column(
                children: <Widget>[
                  SizedBox(height: 90 * SizeConfig.logicalPx),

                  // yanology logo
                  Container(
                    padding: EdgeInsets.all(0),
                    child: Image.asset(
                      "assets/icons/white chart-logo.png",
                      width: 168 * SizeConfig.logicalPx,
                      height: 59 * SizeConfig.logicalPx,
                    ),
                  ),

                  SizedBox(height: 50 * SizeConfig.logicalPx),

                  /// Email and Password
                  Container(
                      width: 269 * SizeConfig.logicalPx,
                      height: 600 * SizeConfig.logicalPx,
                      child: Column(
                        children: <Widget>[
                          /// Email
                          Container(
                              height: 26.5 * SizeConfig.logicalPx,
                              child: TextFormField(
                                autocorrect: false,
                                validator: (val) =>
                                    val.isEmpty ? 'Enter an email' : null,
                                onChanged: (val) {
                                  setState(() => email = val);
                                },
                                decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    hintText: 'Email',
                                    hintStyle: TextStyle(
                                      color: Colors.grey[300],
                                      fontSize: 15 * SizeConfig.logicalPx,
                                      fontWeight: FontWeight.w300,
                                    )),
                                style: TextStyle(color: Colors.white),
                              )),

                          SizedBox(
                              height: (60 - 26.5) * SizeConfig.logicalPx),

                          /// Password
                          Container(
                              height: 26.5 * SizeConfig.logicalPx,
                              child: TextFormField(
                                validator: (val) => val.length < 6
                                    ? 'Enter a password 6+ chars long'
                                    : null,
                                onChanged: (val) {
                                  setState(() => password = val);
                                },
                                obscureText: _obscureText,
                                decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    hintText: 'Password',
                                    hintStyle: TextStyle(
                                      color: Colors.grey[300],
                                      fontSize: 15 * SizeConfig.logicalPx,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    suffixIcon: InkWell(
                                      onTap: () {setState(() =>_obscureText = !_obscureText);},
                                      child: Icon(
                                        _obscureText ? Icons.visibility : Icons.visibility_off,
                                        color: Colors.grey[300],
                                        size: 18.28 * SizeConfig.logicalPx
                                      ),
                                    )
                                ),
                                style: TextStyle(color: Colors.white),
                              )),

                          SizedBox(height: 10.5 * SizeConfig.logicalPx),

                          /// Forgot Password
                          Container(
                            height: 18 * SizeConfig.logicalPx,
                            alignment: Alignment.topRight,
                            child: InkWell(
                                child: Text(
                                  'Forgot Password?',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13 * SizeConfig.logicalPx,
                                    fontWeight: FontWeight.w300,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ResetPassword()),
                                  );
                                }),
                          ),

                          SizedBox(height: 50 * SizeConfig.logicalPx),

                          /// Log In Button
                          Container(
                            width: SizeConfig.width,
                            height: 46 * SizeConfig.logicalPx,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  60 * SizeConfig.logicalPx),
                            ),
                            child: RaisedButton(
                              textColor: Colors.white,
                              color: Colors.teal[300],
                              shape: RoundedRectangleBorder(
                                side: BorderSide.none,
                                borderRadius: BorderRadius.circular(
                                    60 * SizeConfig.logicalPx),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  setState(() {
                                    error = "";
                                    loading = true;
                                  });
                                  dynamic result;
                                  try {
                                    result = await _auth.signInWithWPJsonAPI(
                                        email = email, password = password);
                                  } catch(e) {
                                    setState(() {
                                      error = e.message;
                                      loading = false;
                                    });
                                    return;
                                  }
                                  // email = 'yng.testuser1@gmail.com',
                                  // password = '123456');

                                  // if (result[0] == null) {
                                  user = result[0];
                                  if (!user.isEmailVerified) {
                                    setState(() {
                                      loading = false;
                                    });
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text('Unverified email address'),
                                        content: Text('Do you want to resend the verification link?'),
                                        actions: <Widget>[
                                          new FlatButton(
                                            child: new Text("Resend"),
                                            onPressed: () async {
                                              await user.sendEmailVerification();
                                              await _auth.signOut();
                                              user = null;
                                              setState(() {
                                                error = 'A verification email has been send to your account.';
                                              });
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          new FlatButton(
                                            child: new Text("Cancel"),
                                            onPressed: () async {
                                              await _auth.signOut();
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      )
                                    );
                                  } else {
                                    setState(() {
                                      loading = false;
                                    });
                                    print('signed in');
                                    print(result);
                                  }
                                }
                              },
                              child: Text(
                                'Log In',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15 * SizeConfig.logicalPx),
                              ),
                            ),
                          ),

                          SizedBox(height: 21 * SizeConfig.logicalPx),

                          SizedBox(
                            child: Text(
                              '--------------------- or ---------------------',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 12 * SizeConfig.logicalPx,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 23 * SizeConfig.logicalPx,
                          ),

                          /// facebook and google button
                          Container(
                            height: 60 * SizeConfig.logicalPx,
                            // margin: EdgeInsets.all(0),
                            // padding: EdgeInsets.all(0),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                // facebook button
                                ButtonTheme(
                                  minWidth: 123.0 * SizeConfig.logicalPx,
                                  child: RaisedButton(
                                    textColor: Colors.white,
                                    color: Color(4282210712),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide.none,
                                      borderRadius: BorderRadius.circular(
                                          60 * SizeConfig.logicalPx),
                                    ),
                                    onPressed: () => null,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        // logo
                                        Container(
                                          width: 42 * SizeConfig.logicalPx,
                                          // height: 42 * SizeConfig.vRatio,
                                          // padding: EdgeInsets.all(0),
                                          // margin: EdgeInsets.all(0),
                                          alignment: Alignment.centerLeft,
                                          child: Image.asset(
                                              'assets/icons/facebook_logo_1.png'),
                                        ),
                                        // text
                                        Container(
                                            // padding: EdgeInsets.all(0),
                                            // margin: EdgeInsets.all(0),
                                            width: 58 * SizeConfig.logicalPx,
                                            height: 29 * SizeConfig.logicalPx,
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Login with Facebook',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontFamily: "Quicksand",
                                                  color: Colors.white,
                                                  fontSize: 12 *
                                                      SizeConfig.logicalPx),
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                                // google button
                                ButtonTheme(
                                    minWidth: 123.0 * SizeConfig.logicalPx,
                                    child: (RaisedButton(
                                        textColor: Colors.white,
                                        color: Colors.red,
                                        // color: Color(0xFF27335A),
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide.none,
                                          borderRadius: BorderRadius.circular(
                                              60 * SizeConfig.logicalPx),
                                        ),
                                        onPressed: () async {
                                          setState(() => loading = true);
                                          dynamic result =
                                              await _auth.googleSignIn();
                                          if (result == null) {
                                            setState(() {
                                              error =
                                                  'Couldn\'t find your account or wrong password. ';
                                              loading = false;
                                            });
                                          } else {
                                            print('signed in');
                                            print(result);
                                          }
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            // logo
                                            Container(
                                              width:
                                                  24 * SizeConfig.logicalPx,
                                              alignment: Alignment.centerLeft,
                                              margin:
                                                  EdgeInsets.only(right: 9),
                                              child: Image.asset(
                                                  'assets/icons/google_logo_1.png'),
                                            ),
                                            // text
                                            Container(
                                                // padding: EdgeInsets.all(0),
                                                // margin: EdgeInsets.all(0),
                                                width:
                                                    60 * SizeConfig.logicalPx,
                                                height:
                                                    29 * SizeConfig.logicalPx,
                                                child: Text(
                                                  'Login with Google',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      fontFamily: "Quicksand",
                                                      color: Colors.white,
                                                      fontSize: 12 *
                                                          SizeConfig
                                                              .logicalPx),
                                                ))
                                          ],
                                        ))))
                              ],
                            ),
                          ),

                          SizedBox(
                            height: 10 * SizeConfig.logicalPx,
                          ),

                          /// message appears when error occurrs
                          Text(
                            error,
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 12.0 * SizeConfig.logicalPx,
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.center,
                          ),

                          SizedBox(height: 10 * SizeConfig.logicalPx),

                          /// Don't have an account
                          SizedBox(
                              width: 250,
                              child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Don\'t have an account? ',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12 * SizeConfig.logicalPx,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    InkWell(
                                        child: Text(
                                          'Sign Up',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.grey[300],
                                            fontSize:
                                                12 * SizeConfig.logicalPx,
                                            fontWeight: FontWeight.w300,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Register()),
                                          );
                                        })
                                  ])),

                          SizedBox(height: 5 * SizeConfig.logicalPx),

                          /// Log in as a guest
                          // Container(
                          //   alignment: Alignment.center,
                          //   height: 20 * SizeConfig.logicalPx,
                          //   child: RaisedButton(
                          //     elevation: 0.0, //no shadow
                          //     color: Color(0xFF27335A),
                          //     child: Text(
                          //       'Log in as a guest',
                          //       style: TextStyle(
                          //         color: Color(0xFFFFFFFF),
                          //         fontSize: 12 * SizeConfig.logicalPx,
                          //       ),
                          //     ),
                          //     onPressed: () async {
                          //       setState(() => loading = true);
                          //       dynamic result = await _auth.signInAnon();
                          //       if (result == null) {
                          //         setState(() {
                          //           error =
                          //               'Couldn\'t find your acount or wrong password. ';
                          //           loading = false;
                          //         });
                          //       } else {
                          //         print('signed in');
                          //         print(result);
                          //       }
                          //     },
                          //   ),
                          // ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ));
      }
      }
