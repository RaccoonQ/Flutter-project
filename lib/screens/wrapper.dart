import 'package:yao_app/models/user.dart';
import 'package:yao_app/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yao_app/screens/home.dart';
import 'package:yao_app/services/auth.dart';

var custUserName = "";
var custProduct = "";
var custStatus = "";

class Wrapper extends StatelessWidget {
  final AuthService _auth = new AuthService();
  final String uid = "";
  getCustUserName() async {
    _auth.getSecureInfo("userName").then((userName) => custUserName = userName);
  }

  getCustStatus() async {
    _auth.getSecureInfo("status").then((status) => custStatus = status);
  }

  getCustProduct() async {
    _auth.getSecureInfo("product").then((product) => custProduct = product);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    // return either the Home or Authenticate widget
    if (user == null || !user.isVerified) {
      return Authenticate();
    }
    return Home();
  }
}
