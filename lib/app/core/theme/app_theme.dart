import 'package:flutter/material.dart';
import 'package:hall_of_fame/app/core/theme/palette.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppTheme {
  /// for getting light theme
  ThemeData get lightTheme {
    // TODO: add light theme here
    return ThemeData(
      fontFamily: 'Gotham',
    );
  }

  /// for getting dark theme
  ThemeData get darkTheme {
    // TODO: add dark theme here
    return ThemeData(
      fontFamily: 'Gotham'
    );
  }
}

/// for providing app theme [AppTheme]
final appThemeProvider = Provider<AppTheme>((_) => AppTheme());
