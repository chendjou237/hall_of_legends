import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/theme.dart';


class DateField extends StatelessWidget {
  DateField({
    Key? key,
    required this.hint,
    required this.items,
    required this.onChange,
  }) : super(key: key);
  String hint;
  List<String> items;
  void Function(String?)? onChange;

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
 bool isDarkMode = brightness == Brightness.dark;
    return Container(
      height: 103.h,
      padding: EdgeInsets.symmetric(horizontal: 23.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32.r),
        border: Border.all(color: Palette.primary),
        color: isDarkMode? Colors.transparent: Palette.lightPrimary
      ),
      child: DropdownButton(
        // isExpanded: true,
        dropdownColor: isDarkMode? Palette.dark :Palette.primary,
        underline: const SizedBox(),
        hint: SizedBox(
          width: 140.w,
          child: Text(
            hint,
            style: Style.gothamLight,
          ),
        ),
        style: Style.whiteGothamMedium,
        icon: Icon(Icons.arrow_drop_down, color:isDarkMode? Palette.primary: Palette.dark),
        items: items
            .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(item),
                ))
            .toList(),
        onChanged: onChange,
      ),
    );
  }
}
