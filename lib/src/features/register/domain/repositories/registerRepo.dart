import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../data/models/RegisterRequest..dart';
import '../../data/models/creatUserRequest.dart';

abstract class RegisterRepo {
  Future<Either<Exception, UserCredential>> register(
      RegisterRequest registerRequest);
  Future<Either<Exception, String>> creatUser(UserModel model);
  Future<Either<Exception, String>> uploadProfileImage(File profileImage);
}
