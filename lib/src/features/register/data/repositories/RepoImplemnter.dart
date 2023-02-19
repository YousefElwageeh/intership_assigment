import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intership_assigment/src/conifg/utils/AppStrings.dart';
import 'package:intership_assigment/src/features/register/data/models/RegisterRequest..dart';

import '../../domain/repositories/registerRepo.dart';
import '../datasources/remote_data_source.dart';
import '../models/creatUserRequest.dart';

class RegisterRepoImplemnter extends RegisterRepo {
  RemoteDataSource remoteDataSource = RemoteDataSourceImplFB();

  @override
  Future<Either<Exception, UserCredential>> register(
      RegisterRequest registerRequest) async {
    try {
      var result = await remoteDataSource.Register(registerRequest);
      return Right(result);
    } catch (e) {
      return Left(Exception(e));
    }
  }

  @override
  Future<Either<Exception, String>> creatUser(UserModel model) async {
    try {
      var result = remoteDataSource.CreatUser(model);
      return const Right(FBMessages.CreatUSerSuccess);
    } catch (e) {
      return Left(Exception(e));
    }
  }

  @override
  Future<Either<Exception, String>> uploadProfileImage(
      File profileImage) async {
    try {
      var result = await remoteDataSource.uploadProfileImage(profileImage);
      return Right(result);
    } catch (e) {
      return Left(Exception(e));
    }
  }
}
