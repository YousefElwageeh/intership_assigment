// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:intership_assigment/src/conifg/theme/colorManger.dart';

import '../theme/valuseManger.dart';
import 'AppStrings.dart';

class CommonWidgets {
  // static Widget logoWidget(context) {
  //   return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
  //     SvgPicture.asset(
  //       AssetsManger.Logo,
  //       fit: BoxFit.contain,
  //     ),
  //     Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Text(
  //           AppStrings.Meal,
  //           style: Theme.of(context).textTheme.headlineMedium?.copyWith(
  //               color: ColorManager.primaryColor, fontWeight: FontWeight.bold),
  //         ),
  //         Text(
  //           AppStrings.Monkey,
  //           style: Theme.of(context)
  //               .textTheme
  //               .headlineMedium
  //               ?.copyWith(fontWeight: FontWeight.bold),
  //         )
  //       ],
  //     ),
  //     SizedBox(
  //       height: 10,
  //     ),
  //     Text(AppStrings.FoodDelivery,
  //         style: Theme.of(context).textTheme.bodySmall)
  //   ]);
  // }

  static Widget DefultButton(BuildContext context,
      {required String text,
      void Function()? onPressed,
      bool IsAllInputVAlid = false}) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p28),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: AppSize.s50,
              decoration: BoxDecoration(
                color:
                    IsAllInputVAlid ? ColorManager.primaryColor : Colors.grey,
                borderRadius: BorderRadius.circular(AppSize.s25),
              ),
              child: MaterialButton(
                  onPressed: IsAllInputVAlid ? onPressed : null,
                  child: Text(
                    text,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: ColorManager.scaffoldBackgroundColor),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  static Widget DefultTextFormField({
    required String label,
    TextEditingController? textEditingController,
    bool isThereAnError = false,
    String ErrorMessage = AppStrings.defultTextFormDieldError,
    TextInputType? keyboardType,
    Function()? onTap,
  }) {
    return TextFormField(
        controller: textEditingController,
        onTap: onTap,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: AppSize.s18),
            hintText: label,
            labelText: label,
            errorText: isThereAnError ? null : ErrorMessage));
  }

  static Widget DefultTextButton(
      {required String text1,
      required String text2,
      void Function()? onPressed}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text1),
        TextButton(
          onPressed: onPressed,
          child: Text(
            text2,
            style: TextStyle(
                color: ColorManager.primaryColor, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  static Widget TextTitle(
    context, {
    required String title,
    required String SubTitle,
  }) {
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(fontSize: AppSize.s28),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: AppSize.s18,
        ),
        Text(
          SubTitle,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: AppSize.s16,
              ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: AppSize.s18,
        ),
      ],
    );
  }
}
