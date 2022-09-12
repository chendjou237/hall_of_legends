import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:queen_validators/queen_validators.dart';

import '../../../core/theme/theme.dart';

class MainField extends StatelessWidget {
  const MainField({
    Key? key,
    required this.hint,
    required this.title,
    required this.controller,
    this.validator,
    this.confirm,
  }) : super(key: key);

  final String hint;
  final String title;
  final TextEditingController controller;
  final TextValidationRule? validator;
  final String? confirm;

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: isDarkMode ? Style.whiteGothamMedium : Style.gothamMedium,
        ),
        SizedBox(height: 12.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 29.9.w),
          height: 149.59.h,
          width: 1090.34.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(34.r),
            color: isDarkMode ? Palette.dark : Palette.lightPrimary,
            border: Border.all(color: Palette.primary),
          ),
          child: TextFormField(
            validator: confirm == null
                ? qValidator([IsRequired(), if (validator != null) validator!])
                : (value) {
                    if (value!.isEmpty) {
                      return "value requise";
                    }
                    if (value != confirm) {
                      return "s'il vous plait entrez un text correspondant";
                    }
                    return null;
                  },
            controller: controller,
            style: Style.gothamLight,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: Style.gothamLight,
              labelStyle: Style.gothamLight,
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
