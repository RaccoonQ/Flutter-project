import 'package:yao_app/components/sizeConfig.dart';
import 'package:yao_app/screens/registerDialog.dart';
import 'package:yao_app/services/auth.dart';
import 'package:yao_app/screens/authenticate/sign_in.dart';
import 'package:yao_app/components/loading.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool _obscureText = true;
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String username = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Material(
      child: loading
      ? Loading()
      : Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: Text('Sign In'),
            centerTitle: true,
          ),
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/login_background.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(50),
              //padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        autocorrect: false,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            hintText: 'User Name',
                            hintStyle: TextStyle(
                              color: Colors.grey[300],
                              fontSize: 14,
                            )),
                        style: TextStyle(color: Colors.white),
                        validator: (val) =>
                            val.isEmpty ? 'Enter an email' : null,
                        onChanged: (val) {
                          setState(() => username = val);
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        autocorrect: false,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            hintText: 'Email',
                            hintStyle: TextStyle(
                              color: Colors.grey[300],
                              fontSize: 14,
                            )),
                        style: TextStyle(color: Colors.white),
                        validator: (val) =>
                            val.isEmpty ? 'Enter an email' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                      ),
                      SizedBox(height: 15.0),
                      TextFormField(
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            hintText: 'Password',
                            hintStyle: TextStyle(
                              color: Colors.grey[300],
                              fontSize: 14,
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
                        obscureText: _obscureText,
                        validator: (val) => val.length < 6
                            ? 'Enter a password 6+ chars long'
                            : null,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            hintText: 'Confirm Password',
                            hintStyle: TextStyle(
                              color: Colors.grey[300],
                              fontSize: 14,
                            )),
                        style: TextStyle(color: Colors.white),
                        obscureText: true,
                        validator: (val) =>
                            val != password ? 'Passwords do not match' : null,
                      ),
                      SizedBox(height: 15),
                      Theme(
                        data: ThemeData(unselectedWidgetColor: Colors.white),
                        child: CheckboxListTile(
                          title: Text(
                            'Subscribe to Newsletter',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                          value: checkedValue,
                          onChanged: (newValue) {
                            setState(() {
                              checkedValue = newValue;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                      ),
                      SizedBox(height: 15),
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
                              'Sign Up',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                setState(() => {
                                  error = "",
                                  loading = true
                                });
                                try {
                                  await _auth.registerBothAccounts(
                                      username, email, password);
                                  print('registered');
                                  setState(() => {
                                    loading = false
                                  });
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return RegisterDialog();
                                      }
                                  );
                                } catch(e) {
                                  setState(() {
                                    loading = false;
                                    error = e.message;
                                  });
                                }
                              }
                            }),
                      ),
                      Text(
                        error,
                        style: TextStyle(
                            color: Color(0xFFDFC13B), // Colors.red
                            fontSize: 14.0),
                      ),
                      SizedBox(
                          width: 250,
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Already have an account? ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                InkWell(
                                    child: Text(
                                      'Login',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.grey[300],
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SignIn(),
                                        ),
                                      );
                                    })
                              ])),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
    );
  }
}
/*
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return loading
        ? Loading()
        : Scaffold(
            resizeToAvoidBottomPadding: false,
            backgroundColor: Color(0xFF27335A),
            appBar: AppBar(
              backgroundColor: Color(0xFF27335A),
              elevation: 0.0,
              title: Text('Sign up to Yaonology'),
              actions: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.person, color: Color(0xFF27B8A9)),
                  label: Text('Sign In',
                      style: TextStyle(color: Color(0xFF27B8A9))),
                  onPressed: () => widget.toggleView(),
                ),
              ],
            ),
            extendBodyBehindAppBar: true,
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 100),
                      Padding(
                        padding: EdgeInsets.all(0),
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              "assets/icons/white chart-logo@2x.png",
                              width: size.width * 0.6,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 50),
                      TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Email'),
                        validator: (val) =>
                            val.isEmpty ? 'Enter an email' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Password'),
                        obscureText: true,
                        validator: (val) => val.length < 6
                            ? 'Enter a password 6+ chars long'
                            : null,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: size.width * 0.9,
                        height: size.height * 0.06,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0xFF27B8A9), width: 3.0),
                          borderRadius: BorderRadius.circular(50),
//                            color: Color(0xFF27335A),
                        ),
                        child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            color: Color(0xFF27335A),
                            child: Text("Sign Up",
                                style: TextStyle(
                                    color: Color(0xFF27B8A9),
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold)),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                setState(() => loading = true);
                                dynamic result =
                                    await _auth.registerWithEmailAndPassword(
                                        email, password);
                                if (result == null) {
                                  setState(() {
                                    loading = false;
                                    error =
                                        'Please supply a valid email/The email address is already in use by another account';
                                  });
                                }
                              }
                            }),
                      ),
                      SizedBox(height: 12.0),
                      Text(
                        error,
                        style: TextStyle(
                            color: Color(0xFFDFC13B),
                            // Colors.red
                            fontSize: 14.0),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
*/
