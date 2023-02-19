import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intership_assigment/src/features/Login/domain/repositories/LoginRepo.dart';
import 'package:intership_assigment/src/features/register/data/models/RegisterRequest..dart';

import '../datasources/remote_data_source.dart';

class LoginRepoImplemnter extends LoginRepo {
  RemoteDataSource remoteDataSource = RemoteDataSourceImplFB();

  @override
  Future<Either<Exception, UserCredential>> login(
      RegisterRequest loginRequest) async {
    try {
      UserCredential result = await remoteDataSource.login(loginRequest);
      return Right(result);
    } catch (e) {
      return Left(Exception(e));
    }
  }
}
