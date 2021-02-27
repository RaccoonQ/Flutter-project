import 'package:flutter/material.dart';
import 'package:yao_app/templates/product_page_template.dart';

class SP500 extends StatefulWidget {
  @override
  _SP500State createState() => _SP500State();
}

class _SP500State extends State<SP500> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;
    return ProductPageTemplate(
      'sp500',
      Container(
          width: width,
          height: height,
          padding: EdgeInsets.all(40),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/product_bgimage.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: SingleChildScrollView(
            /// contents: logo, TextFormFields, images
            child: Column(
              children: <Widget>[
                SizedBox(height: height / 25),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'SP500',
                    style: TextStyle(
                      color: Colors.teal[400],
                      fontSize: 24,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Yaonology S&P 500 Strategy provides you buy\n / sell signals that are supplemented by 25\n years of trading data, helping you gain higher\n profit with lower risks in S&P 500 trading.',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      //fontWeight: FontWeight.w300,
                      fontSize: 12,
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Text(
                  'Great Performance',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blue[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        stats(context, "18.89%", "Average\n Annual Return",
                            "Average Annual Return Over\n Certain Trading Period"),
                        stats(context, "78.38%", "Profit\n Percentage",
                            "Ratio of Profit to Cost\n"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        stats(context, "8.06", "Profit Factor\n",
                            "Ratio of Gross Profit to Gross\n Loss for the Entire Trading Period"),
                        stats(context, "37", "Average\n Bars in Trades",
                            "Average Number of\n Days of Transactions"),
                      ],
                    ),
                  ],
                ),
                /*Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Image.asset(
                    'assets/images/group1.png',
                    scale: 1.5,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Image.asset(
                    'assets/images/group2.png',
                    scale: 1.5,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Image.asset(
                    'assets/images/group3.png',
                    scale: 1.5,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Image.asset(
                    'assets/images/group4.png',
                    scale: 1.5,
                  ),
                ),
              ],
            ),*/
                SizedBox(height: 30),
                Text(
                  'Higher Profit Lower Risk',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blue[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    smallImages('assets/icons/product_logo_1.png',
                        'Real-time\nmarket \ndata'),
                    smallImages('assets/icons/product_logo_2.png',
                        'Machine\nlearning technique'),
                    smallImages('assets/icons/product_logo_3.png',
                        'Back-testing\nreport'),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}

Widget smallImages(image, text) {
  return Expanded(
    flex: 2,
    child: Column(
      children: <Widget>[
        Image.asset(image),
        SizedBox(
          height: 5,
        ),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

Widget stats(context, percent, l1, l2) {
  return Expanded(
    flex: 2,
    child: Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.fromLTRB(25, 20, 25, 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
            color: Colors.grey[300],
          ),
          child: Column(children: <Widget>[
            Text(
              percent,
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: Colors.teal[300],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              l1,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: Color(4280759130),
              ),
              textAlign: TextAlign.center,
            ),
          ]),
        ),
        Text(
          l2,
          style: TextStyle(
            fontSize: 10,
            color: Color(4280759130),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
