import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:yao_app/screens/products/payment.dart';
import 'package:yao_app/screens/products/orderConfirmation.dart';
import 'package:yao_app/services/payment_service.dart';

class ExistingCards extends StatefulWidget {
  ExistingCardsState createState() => ExistingCardsState();
}

class ExistingCardsState extends State<ExistingCards> {
  PaymentService _paymentService = PaymentService();

  final List cards = [
    {
      'cardNumber': '4242424242424242',
      'expiryDate': '04/24',
      'cardHolderName': 'test1',
      'cvvCode': '424',
      'showBackView': false,
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Payment payment = ModalRoute.of(context).settings.arguments;
    print(payment);
    var screenSize = MediaQuery.of(context).size;
    // var width = screenSize.width;
    var height = screenSize.height;
    final SizedBox sizeBoxSpacing = SizedBox(height: height / 40);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: false,
        title: Text('Payment'),
        backgroundColor: Color(4280759130),
      ),
      body: Stack(
        children: [
          Container(
            color: Color(0xFFE0E2EB),
            child: ListView(
                padding: const EdgeInsets.all(20.0),
                children: <Widget>[
                  FlatButton(
                      onPressed: () {},
                      child: Image.asset('assets/images/credit_card.png',
                          fit: BoxFit.cover)),
                  sizeBoxSpacing,
                  // orderDetailCard,
                  // sizeBoxSpacing,
                  // billingInformationCard,
                  // sizeBoxSpacing,
                  // billingAddressCard,
                  // sizeBoxSpacing,
                  // buttonContainer
                ]),
          ),
          Container(
              child: ListView.builder(
            itemCount: cards.length,
            itemBuilder: (BuildContext context, int index) {
              var card = cards[index];
              return InkWell(
                onTap: () {
                  _paymentService.payViaNativePayment('29.99', 'USD');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OrderConfirmation()),
                  );
                },
                child: CreditCardWidget(
                  cardNumber: card['cardNumber'],
                  expiryDate: card['expiryDate'],
                  cardHolderName: card['cardHolderName'],
                  cvvCode: card['cvvCode'],
                  showBackView: false,
                ),
              );
            },
          ))
        ],
      ),

      // body: Container(
    );
  }
}
