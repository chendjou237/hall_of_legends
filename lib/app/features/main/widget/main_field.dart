import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:queen_validators/queen_validators.dart';

import '../../../core/theme/theme.dart';

class MainField extends StatefulWidget {
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
  final TextEditingController? confirm;

  @override
  State<MainField> createState() => _MainFieldState();
}

class _MainFieldState extends State<MainField> {
  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
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
            validator: widget.confirm == null
                ? qValidator([
                    IsRequired(),
                    if (widget.validator != null) widget.validator!
                  ])
                : (value) {
                    // if (value!.isEmpty) {
                    //   return "value requise";
                    // }
                    if (value != widget.confirm!.text) {
                      return "s'il vous plait entrez un text correspondant";
                    }
                    return null;
                  },
            controller: widget.controller,
            style: isDarkMode ? Style.whiteGothamLight : Style.darkGothamLight,
            cursorColor: isDarkMode ? Palette.hintColor : Palette.dark,
            decoration: InputDecoration(
              hintText: widget.hint,
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
