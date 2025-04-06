// features/payment/data/models/Payment_Intent_input_Model.dart
class PaymentIntentInputModel {
  final String amount;
 final String currency;
 final String customerId;

 PaymentIntentInputModel({required this.amount,required this.currency,required this.customerId});
  Map<String, dynamic> toJson() => {
        'currency': currency,
        'amount': amount,
        'customer':customerId,
  };

}