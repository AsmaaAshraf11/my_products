// features/payment/presentation/manger/cubit/payment_state.dart
part of 'payment_cubit.dart';

@immutable
sealed class PaymentState {}

final class PaymentInitial extends PaymentState {}

final class PaymentLoading extends PaymentState {}

final class PaymentSuccess extends PaymentState {}

final class PaymentFailur extends PaymentState {
  final String errMessage;
  PaymentFailur(this.errMessage);
}
