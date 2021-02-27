import 'package:stripe_payment/stripe_payment.dart';
import 'package:yao_app/models/payment_response.dart';
// import 'package:yao_app/utilities/keys.dart';

class PaymentService {
  static final PaymentService _paymentService = PaymentService._internal();

  factory PaymentService() {
    return _paymentService;
  }

  PaymentService._internal() {
    final StripeOptions stripeOptions = StripeOptions(
        publishableKey: 'pk_test_mBNkY0nxQdX8Z7Ada9dLcYzz00xI6f0VjI',
        merchantId: "Test",
        androidPayMode: 'test');
    StripePayment.setOptions(stripeOptions);
  }

  Future<PaymentResponse> payViaNativePayment(
      final String amount, final String currencyCode) async {
    final AndroidPayPaymentRequest androidPayRequest = AndroidPayPaymentRequest(
      totalPrice: amount,
      currencyCode: currencyCode,
    );

    final ApplePayPaymentOptions applePayOptions = ApplePayPaymentOptions(
      countryCode: 'US',
      currencyCode: currencyCode,
      items: [ApplePayItem(label: 'Test', amount: amount)],
    );

    try {
      Token token = await StripePayment.paymentRequestWithNativePay(
        androidPayOptions: androidPayRequest,
        applePayOptions: applePayOptions,
      );
      //todo: Please check if token is needed here
      print(token);

      StripePayment.completeNativePayRequest();

      return new PaymentResponse("Payment was successful", true);
    } catch (err) {
      return new PaymentResponse("Payment failed", false);
    }
  }

  Future<PaymentResponse> payViaCreditCard(final CreditCard creditCard,
      final String amount, final String currencyCode) async {
    try {
      final PaymentMethodRequest pmRequest =
          new PaymentMethodRequest(card: creditCard);

      final PaymentMethod paymentMethod =
          await StripePayment.createPaymentMethod(pmRequest);

      final PaymentIntent paymentIntent = new PaymentIntent(
          clientSecret: 'sk_test_QkCwAixZdT7UwPN4wGq7p7XU00MGZhobwg',
          paymentMethodId: paymentMethod.id);
      // todo: please check if paymentIntent is needed here
      print(paymentIntent);

      // final PaymentIntentResult paymentIntentResult =
      //     await StripePayment.confirmPaymentIntent(paymentIntent);

      return new PaymentResponse('Transaction successful', true);
    } catch (err) {
      return new PaymentResponse('Transaction failed', false);
    }
  }
}
