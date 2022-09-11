import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hall_of_fame/app/core/theme/theme.dart';

class Style {
  static TextStyle gotham = TextStyle(fontFamily: "Gotham", );

static TextStyle gothamMedium = gotham.copyWith(fontWeight: FontWeight.w400, color: Palette.black, fontSize: 39.96.sp);
static TextStyle primaryGothamMedium = gotham.copyWith(fontWeight: FontWeight.w400, color: Palette.primary,  fontSize: 39.96.sp);
  static TextStyle whiteGothamMedium =
      gothamMedium.copyWith(color: Colors.white,  fontSize: 39.96.sp);

  static TextStyle gothamLight =
      gotham.copyWith(fontWeight: FontWeight.w300, color: Palette.hintColor, fontSize: 39.sp);
}
