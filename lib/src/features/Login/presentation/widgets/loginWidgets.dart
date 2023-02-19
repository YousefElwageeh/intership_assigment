import 'package:flutter/material.dart';
import 'package:intership_assigment/src/conifg/theme/colorManger.dart';
import 'package:intership_assigment/src/conifg/theme/valuseManger.dart';
import 'package:intership_assigment/src/conifg/utils/AppStrings.dart';
import 'package:intership_assigment/src/conifg/utils/my_flutter_app_icons.dart';

class LoginWidgets {
  static Widget FacebookButton(context, {void Function()? onPressed}) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: AppSize.s60,
        decoration: BoxDecoration(
            color: ColorManager.facebookColor,
            borderRadius: BorderRadius.circular(AppSize.s25)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              MyFlutterApp.facebook_squared,
            ),
            SizedBox(
              width: AppSize.s16,
            ),
            Text(AppStrings.LoginWithFacebook,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: ColorManager.scaffoldBackgroundColor,
                    fontWeight: FontWeight.w500,
                    fontSize: AppSize.s12)),
          ],
        ),
      ),
    );
  }

  static Widget GoogleButton(context, {void Function()? onPressed}) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: AppSize.s60,
        decoration: BoxDecoration(
            color: ColorManager.GoogleColor,
            borderRadius: BorderRadius.circular(AppSize.s25)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              MyFlutterApp.google_plus_square,
            ),
            SizedBox(
              width: AppSize.s16,
            ),
            Text(AppStrings.LoginWithGoogle,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: ColorManager.scaffoldBackgroundColor,
                    fontWeight: FontWeight.w500,
                    fontSize: AppSize.s12)),
          ],
        ),
      ),
    );
  }

  static Widget ForgetPasswordTextButton(context,
      {void Function()? onPressed}) {
    return Column(
      children: [
        TextButton(
          onPressed: onPressed,
          child: Text(
            AppStrings.ForgotYourPassword,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        SizedBox(
          height: AppSize.s120,
        ),
        Text(
          AppStrings.orLoginWith,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        SizedBox(
          height: AppSize.s18,
        ),
      ],
    );
  }
}
