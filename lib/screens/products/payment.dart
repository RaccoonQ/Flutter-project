import 'package:flutter/material.dart';
import 'package:yao_app/models/order_detail.dart';
import 'package:yao_app/models/payment_address_info.dart';
import 'package:yao_app/models/payment_card_info.dart';
import 'package:yao_app/screens/products/existing_cards.dart';

class Payment extends StatefulWidget {
  final String product;
  final double price;
  //final Function toggleView;

  Payment(this.product, this.price);

  @override
  PaymentState createState() => PaymentState();
}

class PaymentState extends State<Payment> {
  PaymentAddressInfo paymentAddressInfo =
      PaymentAddressInfo('', '', '', '', '');

  PaymentCardInfo paymentCardInfo = PaymentCardInfo('', '', '', '');

  TextFormField createTextField(
    final String hintText,
    final String labelText,
    final Function onChangeFunction,
  ) {
    return TextFormField(
        decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            hintText: hintText,
            labelText: labelText,
            hintStyle: TextStyle(
              color: Colors.grey[300],
              fontSize: 14,
              fontWeight: FontWeight.w300,
            )),
        onChanged: onChangeFunction,
        style: TextStyle(color: Colors.black));
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;

    final OrderDetail sampleOrderDetail = new OrderDetail(
        'Bitcoin Strategy Subscription',
        'Bitcoin Strategy Subscription \$29.99/month with a 30-day free trail',
        '29.99');

    final SizedBox sizeBoxSpacing = SizedBox(height: height / 40);

    final Card orderDetailCard = Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Container(
        margin: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(children: [Text('Order Detail')]),
            Row(children: [Text('Product')]),
            Row(children: [
              Flexible(child: Text(sampleOrderDetail.productDescription))
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(children: [Text('Tax')]),
                Column(children: [Text('\$0.00')])
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(children: [Text('OrderTotal')]),
                Column(children: [Text('\$0.00')])
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('----------------------------------')],
            ),
            Row(children: [Text('Recurring Totals')]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(children: [Text('Subtotal')]),
                Column(children: [Text('\$0.00')]),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(children: [Text('Tax')]),
                Column(children: [Text('\$0.00')]),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(children: [Text('Recurring Total')]),
                Column(children: [Text('\$0.00')]),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(children: [Text('NextRenewal')]),
                Column(children: [
                  Text(new DateTime.now().toString().substring(0, 10))
                ]),
              ],
            ),
          ],
        ),
      ),
    );

    final Card billingInformationCard = Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Container(
          margin: const EdgeInsets.all(30.0),
          child: Form(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(0),
                      child: Column(children: <Widget>[])),
                  SizedBox(
                    child: Text('Billing Information',
                        textAlign: TextAlign.center),
                  ),
                  createTextField(
                    'First Last Name',
                    'Name',
                    (val) => {paymentCardInfo.cardHolderName = val},
                  ),
                  createTextField(
                    'Credit Card Number',
                    '1234 5678 910 2345',
                    (val) => {paymentCardInfo.cardNumber = val},
                  ),
                  createTextField(
                    'Expire Date',
                    '11/2018',
                    (val) => {paymentCardInfo.expire = val},
                  ),
                  createTextField(
                    'CVV',
                    '678',
                    (val) => {paymentCardInfo.cvv = val},
                  ),
                ],
              ),
            ),
          )),
    );

    final Card billingAddressCard = Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Container(
        margin: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(0),
                child: Column(
                  children: <Widget>[],
                ),
              ),
              SizedBox(height: 60),
              SizedBox(
                child: Text(
                  'Billing Address',
                  textAlign: TextAlign.center,
                ),
              ),
              createTextField(
                'Street',
                'Street No.',
                (val) => {paymentAddressInfo.street = val},
              ),
              createTextField(
                'Apt No.',
                'Apt No.',
                (val) => {paymentAddressInfo.apartmentNumber = val},
              ),
              createTextField(
                'City',
                'Boston',
                (val) => {paymentAddressInfo.city = val},
              ),
              createTextField(
                'State',
                'MA',
                (val) => {paymentAddressInfo.state = val},
              ),
              createTextField(
                'Zip code',
                '02115',
                (val) => {paymentAddressInfo.zipcode = val},
              ),
            ],
          ),
        ),
      ),
    );

    final Container buttonContainer = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ButtonTheme(
            minWidth: width * 0.6,
            height: height * 0.06,
            child: RaisedButton(
                textColor: Colors.white,
                color: Color(0XFF00BCA9),
                shape: RoundedRectangleBorder(
                    side: BorderSide.none,
                    borderRadius: BorderRadius.circular(70)),
                child: Text('Pay', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ExistingCards()));
                }),
          ),
        ],
      ),
    );

    return Scaffold(
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: false,
          title: Text('payment'),
          backgroundColor: Color(4280759130),
        ),
        body: Container(
          color: Color(0xFFE0E2EB),
          child:
              ListView(padding: const EdgeInsets.all(20.0), children: <Widget>[
            FlatButton(
                onPressed: () {},
                child: Image.asset('assets/images/credit_card.png',
                    fit: BoxFit.cover)),
            sizeBoxSpacing,
            orderDetailCard,
            sizeBoxSpacing,
            billingInformationCard,
            sizeBoxSpacing,
            billingAddressCard,
            sizeBoxSpacing,
            buttonContainer
          ]),
        ));
  }
}
