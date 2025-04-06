// core/utils/stripe_service.dart
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:myproducts/core/utils/api_keys.dart';
import 'package:myproducts/core/utils/stripe_api_service.dart';
import 'package:myproducts/features/payment/data/models/Payment_Intent_input_Model.dart';
import 'package:myproducts/features/payment/data/models/ephameralmosel/ephemeral_Key_Model.dart';
import 'package:myproducts/features/payment/data/models/payment_intent_model/payment_intent_model.dart';

class StripeService {
  final StripeApiService stripeApiService = StripeApiService();

  Future<PaymentIntentModel> CreatePaymentIntentModel(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await stripeApiService.post(
        data: paymentIntentInputModel.toJson(), token: ApiKeys.stripeSecretKey,
        // url: 'https://api.stripe.com/v1/payment_intents',
         endpoints: 'payment_intents');
    var paymentIntentModel = PaymentIntentModel.fromJson(response);
    return paymentIntentModel;
  }

  Future initPaymentSheet({required String paymentIntentClientSecret,required String EphemeralKeySecret,required String customerId}) async {

    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        customerEphemeralKeySecret: EphemeralKeySecret,
        customerId:customerId ,
        // Main params
        merchantDisplayName: 'Flutter Stripe Store Demo',
        paymentIntentClientSecret: paymentIntentClientSecret,
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }
   Future<EphemeralKeyModel> CreateEphemeralKey({
     required String customerId}) async {
      
    var response = await stripeApiService.post(
        data:{'customer':customerId}, 
        headers: {
          'Authorization': 'Bearer ${ApiKeys.stripeSecretKey}',
          'Content-Type': Headers.formUrlEncodedContentType,
          'Stripe-Version':'2025-03-31.basil',
        }, 
        endpoints: 'ephemeral_keys',
        );
      
    var ephemeralKeyModel = EphemeralKeyModel.fromJson(response);
    return ephemeralKeyModel;
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel =
        await CreatePaymentIntentModel(paymentIntentInputModel);
         var ephemeralKeyModel =
       await CreateEphemeralKey(customerId: paymentIntentInputModel.customerId);
      
       print(ephemeralKeyModel.secret!);
    await initPaymentSheet(
        paymentIntentClientSecret: paymentIntentModel.clientSecret!, EphemeralKeySecret:ephemeralKeyModel.secret!, customerId: paymentIntentInputModel.customerId);
    await displayPaymentSheet();
  }

 
}
