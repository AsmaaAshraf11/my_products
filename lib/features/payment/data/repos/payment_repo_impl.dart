// features/payment/data/repos/payment_repo_impl.dart
import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:myproducts/core/errors/failures.dart';
import 'package:myproducts/core/utils/stripe_service.dart';
import 'package:myproducts/features/payment/data/models/Payment_Intent_input_Model.dart';
import 'package:myproducts/features/payment/data/repos/payment_repo.dart';

class PaymentRepoImpl implements PaymentRepo {
  final StripeService stripeService = StripeService();

  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeService.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);
      return right(unit);
    } catch (error) {
      return left(ServerFailure(error.toString()));
    }
  }
}
