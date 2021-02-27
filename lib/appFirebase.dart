import 'package:yao_app/screens/wrapper.dart';
import 'package:yao_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yao_app/models/user.dart';

class AppFirebase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: Wrapper(),
    );
  }
}
