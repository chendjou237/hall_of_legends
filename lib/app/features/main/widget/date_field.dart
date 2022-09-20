import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/theme/theme.dart';

class DateField extends StatefulWidget {
  DateField({
    Key? key,
    required this.hint,
    required this.items,
    this.value,
  }) : super(key: key);
  String hint;
  List<String> items;
  StateController<String?>? value;

  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Container(
      height: 100.h,
      width: 260.w,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32.r),
          border: Border.all(color: Palette.primary),
          color: isDarkMode ? Colors.transparent : Palette.lightPrimary),
      child: DropdownButtonFormField(
        // isExpanded: true,
        value: widget.value?.state,

        dropdownColor: isDarkMode ? Palette.dark : Palette.primary,
        validator: (val) {
          if (val == null) {
            //TODO: loc
            return "please enter a correct value";
          }
          return null;
        },
        isDense: true,

        decoration: InputDecoration(
          hintText: widget.hint,
          isCollapsed: true,
        ),

        hint: Text(
          widget.hint,
          style: Style.gothamLight,
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
          if (newValue != null) {
            setState(() {
              widget.value?.state = newValue.toString();
            });
          }
        },
      ),
    );
  }
}
