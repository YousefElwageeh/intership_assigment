import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intership_assigment/src/conifg/utils/assetsManger.dart';

import 'package:intership_assigment/src/features/register/presentation/pages/RegisterScreen.dart';
import '../../../../conifg/theme/valuseManger.dart';
import '../../../../conifg/utils/AppStrings.dart';
import '../../../../conifg/utils/commonWidgets.dart';
import '../../../../core/appStates/AppStates.dart';
import '../viewModel/loginViewModel.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _loginViewModel = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSize.s25),
            child: Obx(
              () => Column(
                children: [
                  //sadfsadfsdfa
                  CommonWidgets.TextTitle(context,
                      title: AppStrings.Login,
                      SubTitle: AppStrings.loginDetails),
                  LottieBuilder.asset(AssetsManger.loginAnimation,
                      repeat: false),
                  CommonWidgets.DefultTextFormField(
                    textEditingController: _loginViewModel.textEmailController,
                    label: AppStrings.Email,
                    onTap: () => _loginViewModel.addRealTimeListener(1),
                    isThereAnError: _loginViewModel.isUserNameVaild.value,
                    ErrorMessage: AppStrings.EmailError,
                  ),
                  const SizedBox(
                    height: AppSize.s18,
                  ),
                  CommonWidgets.DefultTextFormField(
                      textEditingController:
                          _loginViewModel.textPasswordController,
                      label: AppStrings.Password,
                      onTap: () => _loginViewModel.addRealTimeListener(2),
                      isThereAnError: _loginViewModel.isPasswordVaild.value,
                      ErrorMessage: AppStrings.PasswordError),
                  _loginViewModel.isLoading.value
                      ? AppStates.loadingState()
                      : CommonWidgets.DefultButton(context,
                          text: AppStrings.Login,
                          onPressed: () => _loginViewModel.login(),
                          IsAllInputVAlid:
                              _loginViewModel.allInputsValid.value),
                  CommonWidgets.DefultTextButton(
                    text1: AppStrings.DonotHaveAnAccount,
                    text2: AppStrings.SignUp,
                    onPressed: () => Get.to(() => SignUpScreen()),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
