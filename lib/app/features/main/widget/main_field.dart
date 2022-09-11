import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../l10n/l10n.dart';
import '../../../core/theme/theme.dart';

class MainField extends StatelessWidget {
  const MainField({
    Key? key,
    required this.hint,
    required this.title,
  }) : super(key: key);

  final String hint;
  final String title;

  @override
  Widget build(BuildContext context) {
       var brightness = MediaQuery.of(context).platformBrightness;
 bool isDarkMode = brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
         title,
          style:isDarkMode? Style.whiteGothamMedium: Style.gothamMedium,
        ),
        SizedBox(height: 12.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 29.9.w),
          height: 149.59.h,
          width: 1090.34.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(34.r),
            color: isDarkMode? Palette.dark: Palette.lightPrimary,
            border: Border.all(color: Palette.primary),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: Style.gothamLight,
              border: InputBorder.none,
              
            ),
          ),
        ),
      ],
    );
  }
}
