// features/payment/presentation/manger/cubit/payment_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:myproducts/features/payment/data/models/Payment_Intent_input_Model.dart';
import 'package:myproducts/features/payment/data/repos/payment_repo.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.paymentRepo) : super(PaymentInitial());
  static PaymentCubit get(context) => BlocProvider.of(context);

  final PaymentRepo paymentRepo;

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(PaymentLoading());
    var data = await paymentRepo.makePayment(
        paymentIntentInputModel: paymentIntentInputModel);

    data.fold((failure) {
      emit(PaymentFailur(failure.errorMessage.toString()));
      print(failure.errorMessage);
    }, (success) {
      emit(PaymentSuccess());
    });
  }
}
