import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intership_assigment/src/conifg/theme/valuseManger.dart';
import 'package:intership_assigment/src/conifg/utils/AppStrings.dart';
import 'package:intership_assigment/src/conifg/utils/assetsManger.dart';
import 'package:intership_assigment/src/conifg/utils/commonWidgets.dart';
import 'package:intership_assigment/src/core/appStates/AppStates.dart';
import 'package:intership_assigment/src/features/Login/presentation/pages/loginScreen.dart';
import 'package:intership_assigment/src/features/register/presentation/viewModel/registerViewModel.dart';

import '../widgets/registerWidgets.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final _registerViewModel = Get.put(RegisterViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p28),
        child: SafeArea(
          child: SingleChildScrollView(
            child: MixinBuilder<RegisterViewModel>(
              init: RegisterViewModel(),
              builder: (controller) => Column(
                children: [
                  CommonWidgets.TextTitle(context,
                      title: AppStrings.SignUp,
                      SubTitle: AppStrings.SignUpDetails),
                  Align(
                      child: CircleAvatar(
                          radius: AppSize.s40,
                          backgroundImage: _registerViewModel
                                  .isProfileUploded.value
                              ? FileImage(File(_registerViewModel.image!.path))
                              : const AssetImage(AssetsManger.personImage)
                                  as ImageProvider)),
                  const SizedBox(
                    height: AppSize.s25,
                  ),
                  Row(
                    children: [
                      RegisterWidgets.dropdownWidget(
                        defultvalue: _registerViewModel.dropDownButtonValue,
                        items: _registerViewModel.items,
                        onChanged: (value) {
                          _registerViewModel.dropDownButtonUpdate(value);
                        },
                      ),
                      const Spacer(),
                      SizedBox(
                        width: AppSize.s190,
                        child: CommonWidgets.DefultButton(
                          IsAllInputVAlid: true,
                          context,
                          text: AppStrings.UplodePhoto,
                          onPressed: () {
                            _registerViewModel.getImage();
                          },
                        ),
                      )
                    ],
                  ),
                  CommonWidgets.DefultTextFormField(
                      onTap: () =>
                          _registerViewModel.addRealTimeListener(index: 1),
                      label: AppStrings.Name,
                      textEditingController:
                          _registerViewModel.textNameController,
                      isThereAnError: _registerViewModel.isUserNameVaild.value),
                  const SizedBox(
                    height: AppSize.s25,
                  ),
                  CommonWidgets.DefultTextFormField(
                      onTap: () =>
                          _registerViewModel.addRealTimeListener(index: 2),
                      label: AppStrings.Email,
                      textEditingController:
                          _registerViewModel.textEmailController,
                      isThereAnError: _registerViewModel.isEmailVaild.value,
                      ErrorMessage: AppStrings.EmailError),
                  const SizedBox(
                    height: AppSize.s25,
                  ),
                  CommonWidgets.DefultTextFormField(
                      onTap: () =>
                          _registerViewModel.addRealTimeListener(index: 3),
                      label: AppStrings.MobileNumber,
                      textEditingController:
                          _registerViewModel.mobileNumberController,
                      isThereAnError: _registerViewModel.isPhoneVaild.value,
                      keyboardType: TextInputType.phone),
                  const SizedBox(
                    height: AppSize.s25,
                  ),
                  CommonWidgets.DefultTextFormField(
                      onTap: () =>
                          _registerViewModel.addRealTimeListener(index: 4),
                      label: AppStrings.Password,
                      textEditingController:
                          _registerViewModel.textPasswordController,
                      isThereAnError: _registerViewModel.isPasswordVaild.value,
                      ErrorMessage: AppStrings.PasswordError),
                  const SizedBox(
                    height: AppSize.s25,
                  ),
                  CommonWidgets.DefultTextFormField(
                      onTap: () =>
                          _registerViewModel.addRealTimeListener(index: 5),
                      textEditingController:
                          _registerViewModel.collegeNameController,
                      label: AppStrings.CollegeName,
                      isThereAnError:
                          _registerViewModel.isColleageNameValid.value),
                  const SizedBox(
                    height: AppSize.s25,
                  ),
                  CommonWidgets.DefultTextFormField(
                      onTap: () =>
                          _registerViewModel.addRealTimeListener(index: 6),
                      textEditingController:
                          _registerViewModel.admissionYearController,
                      label: _registerViewModel.studentStateLabel,
                      isThereAnError: _registerViewModel.isadmissionValid.value,
                      keyboardType: TextInputType.datetime),
                  SizedBox(
                    width: AppSize.s190,
                    child: CommonWidgets.DefultButton(
                      IsAllInputVAlid: true,
                      context,
                      text: AppStrings.UplodeResume,
                      onPressed: () => _registerViewModel.getPdf(),
                    ),
                  ),
                  _registerViewModel.isLoading.value
                      ? AppStates.loadingState()
                      : CommonWidgets.DefultButton(context,
                          text: AppStrings.SignUp,
                          onPressed: () => _registerViewModel.register(),
                          IsAllInputVAlid:
                              _registerViewModel.allInputsValid.value),
                  CommonWidgets.DefultTextButton(
                      text1: AppStrings.AlreadyHaveAnAccount,
                      text2: AppStrings.Login,
                      onPressed: () => Get.to(() => LoginScreen()))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
