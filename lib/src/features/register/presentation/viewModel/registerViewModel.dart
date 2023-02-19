import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intership_assigment/src/conifg/utils/AppStrings.dart';
import 'package:intership_assigment/src/core/appStates/AppStates.dart';
import 'package:intership_assigment/src/features/register/data/models/RegisterRequest..dart';
import 'package:intership_assigment/src/features/register/domain/repositories/registerRepo.dart';

import '../../../Login/presentation/pages/loginScreen.dart';
import '../../data/models/creatUserRequest.dart';
import '../../data/repositories/RepoImplemnter.dart';

class RegisterViewModel extends GetxController {
  TextEditingController textEmailController = TextEditingController();
  TextEditingController textNameController = TextEditingController();
  TextEditingController textPasswordController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController collegeNameController = TextEditingController();
  TextEditingController admissionYearController = TextEditingController();
  RxBool isUserNameVaild = true.obs;
  RxBool isPhoneVaild = true.obs;

  RxBool isEmailVaild = true.obs;

  RxBool isPasswordVaild = true.obs;
  RxBool isColleageNameValid = true.obs;

  RxBool isadmissionValid = true.obs;

  RxBool allInputsValid = false.obs;
  RxBool isLoading = false.obs;
  void addRealTimeListener({
    required int index,
  }) {
    switch (index) {
      case 1:
        textNameController.addListener(() {
          isUserNameVaild.value =
              textNameController.text.isEmpty ? false : true;
          areAllInputsValid();
        });
        break;
      case 2:
        textEmailController.addListener(() {
          isEmailVaild.value = GetUtils.isEmail(textEmailController.text);
          areAllInputsValid();
        });

        break;
      case 3:
        mobileNumberController.addListener(() {
          isPhoneVaild.value =
              mobileNumberController.text.isEmpty ? false : true;
          areAllInputsValid();
        });
        break;
      case 4:
        textPasswordController.addListener(() {
          isPasswordVaild.value =
              textPasswordController.text.length >= 6 ? true : false;
          areAllInputsValid();
        });
        break;
      case 5:
        textPasswordController.addListener(() {
          isColleageNameValid.value =
              collegeNameController.text.isEmpty ? false : true;
          areAllInputsValid();
        });
        break;
      case 6:
        textPasswordController.addListener(() {
          isadmissionValid.value =
              admissionYearController.text.isEmpty ? false : true;
          areAllInputsValid();
        });
        break;
      default:
        print('wrong number');
    }
  }

  void areAllInputsValid() {
    if (isUserNameVaild.value &&
        isPhoneVaild.value &&
        isEmailVaild.value &&
        isPasswordVaild.value &&
        isColleageNameValid.value &&
        isadmissionValid.value) {
      allInputsValid.value = true;
    } else {
      allInputsValid.value = false;
    }
  }

  RegisterRepo registerRepo = RegisterRepoImplemnter();
  void register() async {
    areAllInputsValid();
    print(textEmailController.text);
    print(textPasswordController.text);
    if (allInputsValid.value) {
      RegisterRequest registerRequest = RegisterRequest(
        email: textEmailController.text,
        password: textPasswordController.text,
      );
      isLoading.value = true;

      registerRepo
          .register(registerRequest)
          .then((value) => value.fold((exception) {
                isLoading.value = false;
                print(exception);
                AppStates.ErrorState(exception.toString());
              }, (data) {
                UserModel userModel = UserModel(
                  email: registerRequest.email,
                  name: textNameController.text,
                  phone: mobileNumberController.text,
                  uId: data.user!.uid,
                );
                uplodeImageProfile();
                creatUser(userModel);
                AppStates.SucessState(AppStrings.SucessRegister);
                isLoading.value = false;
                Get.to(() => LoginScreen());
              }));
    }
  }

  void creatUser(UserModel model) {
    registerRepo.creatUser(model).then((value) => value.fold((exception) {
          print(exception);
        }, (data) {
          print(data);
        }));
  }

  void uplodeImageProfile() {
    if (isProfileUploded.value) {
      File file = File(image!.path);

      registerRepo
          .uploadProfileImage(file)
          .then((value) => value.fold((exception) {
                print(exception);
              }, (data) {
                print(data);
              }));
    }
  }

  var items = [
    'faculty',
    'alumni',
  ];

  String? dropDownButtonValue = AppStrings.faculty;
  String studentStateLabel = AppStrings.admissionYear;
  void dropDownButtonUpdate(String? newValue) {
    dropDownButtonValue = newValue;
    if (dropDownButtonValue == AppStrings.faculty) {
      studentStateLabel = AppStrings.admissionYear;
    } else {
      studentStateLabel = AppStrings.passOutYear;
    }
    update();
  }

  RxBool isProfileUploded = false.obs;
  XFile? image;

  void getImage() async {
    final ImagePicker picker = ImagePicker();
    await picker.pickImage(source: ImageSource.gallery).then((value) {
      image = value;

      isProfileUploded.value = true;
      update();
    }).catchError((e) {
      print(e);
    });
  }

  Future<void> getPdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    update();
  }
}
