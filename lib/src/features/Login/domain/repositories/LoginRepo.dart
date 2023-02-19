import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../register/data/models/RegisterRequest..dart';

abstract class LoginRepo {
  Future<Either<Exception, UserCredential>> login(RegisterRequest loginRequest);
}
