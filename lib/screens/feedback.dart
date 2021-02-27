import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:yao_app/screens/feedbackDialog.dart';
class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  var _rating = 0.0;
  var _commentController = new TextEditingController();
  var _dialog = FeedbackDialog();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(119),
            child: AppBar(
              centerTitle: false,
              title: Text(
                'Feedback',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25),
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
            ),
          ),
          body: Container(
            alignment: Alignment.center,
            child: Stack(
              children: <Widget>[
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 60,
                      ),
                      Center(
                        child: Text(
                          "Any feedback about the app? Let us know!",
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF7481AC),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Center(
                          child: SmoothStarRating(
                            rating: _rating,
                            isReadOnly: false,
                            size: 40,
                            filledIconData: Icons.star,
                            halfFilledIconData: Icons.star_half,
                            defaultIconData: Icons.star_border,
                            color: Color(0xFF27B8A9),
                            borderColor: Color(0xFF27B8A9),
                            starCount: 5,
                            allowHalfRating: false,
                            spacing: 0.0,
                            onRated: (value) {
                              _rating = value;
                            },
                          )
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Container(
                            width: 311,
                            height: 126,
                            child: TextField(
                              maxLines: 4,
                              controller: _commentController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 16.0,
                                        color: Color(0xFF929CBE)
                                    ),
                                    borderRadius: BorderRadius.circular(16)
                                ),
                              ),
                            )
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Container(
                          width: 99,
                          height: 41,
                          child: FlatButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext cxt) {
                                    return _dialog;
                                  });
                            },
                            color: Color(4280759130),
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Text(
                              'Send',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        )
                      )
                    ]
                )
              ],
            ),
          ),
        )
    );
  }
}