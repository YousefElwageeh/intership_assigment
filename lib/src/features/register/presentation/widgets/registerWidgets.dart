import 'package:flutter/material.dart';

class RegisterWidgets {
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

  static Widget dropdownWidget({
    String? defultvalue,
    required List<String> items,
    Function(String?)? onChanged,
  }) {
    return DropdownButton(

        // Initial Value
        value: defultvalue,

        // Down Arrow Icon
        icon: Row(
          children: const [
            Icon(Icons.keyboard_arrow_down),
          ],
        ),

        // Array list of items
        items: items.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        }).toList(),
        // After selecting the desired option,it will
        // change button value to selected value
        onChanged: onChanged);
  }
}
