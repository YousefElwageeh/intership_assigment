// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intership_assigment/src/features/register/data/models/creatUserRequest.dart';

import '../models/RegisterRequest..dart';

abstract class RemoteDataSource {
  void CreatUser(UserModel model);
  Future<UserCredential> Register(RegisterRequest registerRequest);
  Future<String> uploadProfileImage(File profileImage);
}

class RemoteDataSourceImplFB implements RemoteDataSource {
  @override
  void CreatUser(model) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(model.uId)
        .set(model.toMap());
  }

  @override
  Future<UserCredential> Register(RegisterRequest registerRequest) async {
    return await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: registerRequest.email, password: registerRequest.password);
  }

  @override
  Future<String> uploadProfileImage(File profileImage) async {
    var result = FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage.path).pathSegments.last}')
        .putFile(profileImage);

    return await result.snapshot.ref.getDownloadURL();
  }
}
