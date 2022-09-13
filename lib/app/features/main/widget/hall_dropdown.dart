import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/theme.dart';

class HallDropDown extends StatefulWidget {
  HallDropDown({
    Key? key,
    required this.items,
    required this.value,
    required this.hint,
  }) : super(key: key);

  final List<String> items;
  final String hint;
  String value;

  @override
  State<HallDropDown> createState() => _HallDropDownState();
}

class _HallDropDownState extends State<HallDropDown> {
  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 29.w),
      decoration: BoxDecoration(
          color: isDarkMode ? Palette.dark : Palette.lightPrimary,
          border: Border.all(color: Palette.primary),
          borderRadius: BorderRadius.circular(32.34.r)),
      child: DropdownButton(
          isExpanded: true,
          underline: const SizedBox(),
          hint: Text(
            widget.hint,
            style: Style.gothamLight,
          ),
          value: widget.value,
          dropdownColor: isDarkMode ? Palette.dark : Palette.white,
          items: widget.items
              .map((l) => DropdownMenuItem(
                    value: l,
                    child: Text(
                      l,
                      style: Style.gotham.copyWith(
                          color: isDarkMode ? Palette.white : Palette.primary),
                    ),
                  ))
              .toList(),
          onChanged: (val) {
            setState(() {
              widget.value = val.toString();
            });
          }),
    );
  }
}
