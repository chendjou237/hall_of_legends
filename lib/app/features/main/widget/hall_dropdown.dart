import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/theme.dart';


class HallDropDown extends StatelessWidget {
  const HallDropDown({
    Key? key,
    required this.items,
    required this.hint,
  }) : super(key: key);

  final List<String> items;
  final String hint;

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
 bool isDarkMode = brightness == Brightness.dark;
    return Container(
      padding: EdgeInsets.symmetric(horizontal:29.w ),
      decoration: BoxDecoration(
          color: isDarkMode? Palette.dark : Palette.lightPrimary, border: Border.all(color: Palette.primary),
          borderRadius: BorderRadius.circular(32.34.r)
          ),

      child: DropdownButton(
          isExpanded: true,
          underline: const SizedBox(),
          hint: Text(hint, style: Style.gothamLight,),

          items: items
              .map((l) => DropdownMenuItem(
                    value: l,
                    child: Text(l),
                  ))
              .toList(),
          onChanged: (val) {}),
    );
  }
}