import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intership_assigment/src/conifg/utils/AppStrings.dart';
import 'package:intership_assigment/src/core/appStates/AppStates.dart';
import 'package:intership_assigment/src/features/Login/domain/repositories/LoginRepo.dart';
import 'package:intership_assigment/src/features/register/data/models/RegisterRequest..dart';

import '../../data/repositories/RepoImplemnter.dart';
import '../pages/home.dart';

class LoginViewModel extends GetxController {
  TextEditingController textEmailController = TextEditingController();
  TextEditingController textPasswordController = TextEditingController();
  RxBool isUserNameVaild = true.obs;

  RxBool isPasswordVaild = true.obs;

  RxBool isLoading = false.obs;
  RxBool allInputsValid = false.obs;
  void addRealTimeListener(int index) {
    switch (index) {
      case 1:
        textEmailController.addListener(() {
          isUserNameVaild.value = GetUtils.isEmail(textEmailController.text);
          areAllInputsValid();
        });
        break;
      case 2:
        textPasswordController.addListener(() {
          textPasswordController.text.length >= 6
              ? isPasswordVaild.value = true
              : isPasswordVaild.value = false;
          areAllInputsValid();
        });
        break;
    }
  }

  void areAllInputsValid() {
    if (isPasswordVaild.value && isUserNameVaild.value) {
      allInputsValid.value = true;
    } else {
      allInputsValid.value = false;
    }
  }

  LoginRepo loginRepo = LoginRepoImplemnter();
  void login() async {
    if (isPasswordVaild.value && isUserNameVaild.value) {
      isLoading.value = true;
      print(textEmailController.text);
      print(textPasswordController.text);
      RegisterRequest loginRequest = RegisterRequest(
        email: textEmailController.text,
        password: textPasswordController.text,
      );
      loginRepo.login(loginRequest).then((value) => value.fold((exception) {
            debugPrint(exception as String?);
            AppStates.ErrorState(exception.toString());
            isLoading.value = false;
          }, (data) {
            AppStates.SucessState(AppStrings.SucessLogin);
            isLoading.value = false;
            Get.to(() => const HomeScreen());
          }));
    }
  }

  RxBool isPasswordShown = true.obs;

  void changePasswordIcon() {
    isPasswordShown.value = !isPasswordShown.value;
  }
}
