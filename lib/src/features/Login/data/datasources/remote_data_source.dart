// ignore_for_file: non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';

import '../../../register/data/models/RegisterRequest..dart';

abstract class RemoteDataSource {
  Future<UserCredential> login(RegisterRequest loginRequest);
}

class RemoteDataSourceImplFB implements RemoteDataSource {
  @override
  Future<UserCredential> login(RegisterRequest loginRequest) async {
    return FirebaseAuth.instance.signInWithEmailAndPassword(
        email: loginRequest.email, password: loginRequest.password);
  }
}
