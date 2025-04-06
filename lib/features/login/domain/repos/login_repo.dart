// features/login/domain/repos/login_repo.dart
import 'package:dartz/dartz.dart';
import 'package:myproducts/features/login/data/models/login_model.dart';

import '../../../../core/errors/failures.dart';

abstract class LoginRepo {
  Future<Either<Failure, LoginResult>> fetchDataLogin(
      String name, String password);
}
