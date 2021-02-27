import 'package:flutter/material.dart';
import 'package:yao_app/templates/product_page_template.dart';

class Bitcoin extends StatefulWidget {
  @override
  _BitcoinState createState() => _BitcoinState();
}

class _BitcoinState extends State<Bitcoin> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;
    return ProductPageTemplate(
      'bitcoin',
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
        child: Column(
          children: <Widget>[
            SizedBox(height: height / 25),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Bitcoin',
                style: TextStyle(
                  color: Colors.teal[400],
                  fontSize: 24,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Yaonology Bitcoin Strategy provides you buy\n / sell signals that are supported by 5\n years of trading data, helping you gain higher\n profit with lower risks in Bitcoin trading.',
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
              children: <Widget>[
                Row(
                  children: <Widget>[
                    stats(context, "95.62%", "Average\n Annual Return",
                        "Average Annual Return Over\n Certain Trading Period"),
                    stats(context, "80.65%", "Profit\n Percentage",
                        "Average Annual Return Over\nCertainer Trading Period")
                  ],
                ),
                Row(
                  children: <Widget>[
                    stats(context, "6.03", "Profit Factor\n",
                        "Average Annual Return Over\n Certainer Trading Period"),
                    stats(context, "29", "Average\nBars in Trades",
                        "Average Annual Return Over\n Certain Trading Period")
                  ],
                ),
              ],
            ),
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
                smallImages(
                    'assets/icons/product_logo_3.png', 'Back-testing\nreport'),
              ],
            ),
          ],
        ),
      ),
    );
    //'assets/images/sp500_product_page.png');
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
