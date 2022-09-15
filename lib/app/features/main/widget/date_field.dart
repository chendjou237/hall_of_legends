import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/theme.dart';

class DateField extends StatefulWidget {
  DateField({
    Key? key,
    required this.hint,
    required this.items,
    required this.value,
  }) : super(key: key);
  String hint;
  List<String> items;
  String value;

  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
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
          color: isDarkMode ? Colors.transparent : Palette.lightPrimary),
      child: DropdownButton(
        // isExpanded: true,
        value: widget.value,
        dropdownColor: isDarkMode ? Palette.dark : Palette.primary,
        underline: const SizedBox(),
        hint: SizedBox(
          width: 140.w,
          child: Text(
            widget.hint,
            style: Style.gothamLight,
          ),
        ),
        style: isDarkMode ? Style.whiteGothamLight : Style.darkGothamLight,
        icon: Icon(Icons.arrow_drop_down,
            color: isDarkMode ? Palette.primary : Palette.dark),
        items: widget.items
            .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(item),
                ))
            .toList(),
        onChanged: (newValue) {
          setState(() {
            widget.value = newValue.toString();
          });
        },
      ),
    );
  }
}
