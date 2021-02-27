import 'package:flutter/material.dart';

class LoginTemplate extends StatelessWidget {
  final Text temptitle;
  final Container tempbody;

  LoginTemplate(this.temptitle, this.tempbody);

  @override
  Widget build(BuildContext context) {
    return
        //MaterialApp(
        //home:
        Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: temptitle,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/login_background.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: tempbody,
      ),
    );
  }
}
/*
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Image(
                  image: AssetImage('assets/icons/login_arrow.png'),
                ),
                onPressed: () {
                  //Scaffold.of(context).openDrawer();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignIn(),
                    ),
                  );
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: temptitle,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/login_background.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: tempbody,
        ),
      ),
    );
  }
}
*/
