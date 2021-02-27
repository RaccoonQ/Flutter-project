import 'package:flutter/material.dart';
// import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:yao_app/screens/products/checkout.dart';
import 'package:yao_app/templates/sidebar_template.dart';

class ProductPageTemplate extends StatelessWidget {
  final Container body;
  final String page;

  ProductPageTemplate(this.page, this.body);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;

    return Scaffold(
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        endDrawer: SideBar(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: height), child: body),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.grey[100],
          // height: height / 9,
          // width: width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: width / 3,
              ),
              ButtonTheme(
                minWidth: width / 3,
                height: height / 15,
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.teal[300],
                  shape: RoundedRectangleBorder(
                    side: BorderSide.none,
                    borderRadius: BorderRadius.circular(70),
                  ),
                  child: Text(
                    'Start Free Trial',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Checkout()),
                    );
                  },
                ),
              ),
              SizedBox(
                width: width / 30,
              ),
              ButtonTheme(
                height: height / 15,
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.yellow[700],
                  shape: CircleBorder(
                      side: BorderSide(
                    width: 4,
                    color: Colors.yellow[700],
                  )),
                  child: Text(
                    'FAQ',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    _settingModalBottomSheet(context);
                  },
                ),
              ),
            ],
          ),
        ));
  }
}

void _settingModalBottomSheet(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          padding: EdgeInsets.all(15),
          child: new ListView(
            children: <Widget>[
              SizedBox(height: 20),
              Text(
                'FAQ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blue[900],
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Did not answer your question?",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                "Contact Us",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blue[900],
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Questions will be answered through email',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 5),
              Form(
                  child: Container(
                height: 400,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: TextFormField(
                        minLines: 6,
                        maxLines: 7,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue[900]),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue[900]),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: Colors.blue[900],
                        shape: RoundedRectangleBorder(
                          side: BorderSide.none,
                          borderRadius: BorderRadius.circular(70),
                        ),
                        child: Text(
                          'Send',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              )),
            ],
          ),
        );
      });
}
