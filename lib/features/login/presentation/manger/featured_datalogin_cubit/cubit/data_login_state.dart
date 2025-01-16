// features/home/presentation/manger/featured_datalogin_cubit/cubit/data_login_state.dart
part of 'data_login_cubit.dart';

@immutable
sealed class DataLoginState {}

final class DataLoginInitial extends DataLoginState {}
class DataLoginLoading extends DataLoginState {}

class DataLoginFailure extends DataLoginState {
  final String errMessage;

  DataLoginFailure(this.errMessage);
}

class DataLoginSuccess extends DataLoginState {
  final LoginModel model;

  DataLoginSuccess(this.model);
}

