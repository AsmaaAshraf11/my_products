// features/payment/data/repos/payment_repo.dart
import 'package:dartz/dartz.dart';
import 'package:myproducts/core/errors/failures.dart';
import 'package:myproducts/features/payment/data/models/Payment_Intent_input_Model.dart';

abstract class PaymentRepo {
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel});
}
