import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intership_assigment/src/conifg/theme/colorManger.dart';
import 'package:intership_assigment/src/conifg/theme/valuseManger.dart';

class AppStates {
  static ErrorState(message) {
    return Get.snackbar('Error', message,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red);
  }

  static SucessState(message) {
    return Get.snackbar('Sucess', message,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green);
  }

  static Widget loadingState() {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p20),
      child: Center(
          child: CircularProgressIndicator(
        color: ColorManager.primaryColor,
      )),
    );
  }
}
