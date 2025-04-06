// features/signUp/domain/repos/register_repo.dart
import 'package:dartz/dartz.dart';
import 'package:myproducts/features/login/data/models/login_model.dart';

import '../../../../core/errors/failures.dart';

abstract class RegisterRepo {
  Future<Either<Failure, LoginModel>> fetchDataRegister(
      String name, String password);
}
