import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hall_of_fame/app/core/theme/palette.dart';
import 'package:hall_of_fame/app/features/main/view/main_view.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 7),
        () => GoRouter.of(context).go(MainView.routeName));
            var brightness = MediaQuery.of(context).platformBrightness;

bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDarkMode? Palette.dark: Palette.white,
      body: Container(
       
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/splahscreen.png'), fit: BoxFit.fill),

        ),
        alignment: Alignment.bottomCenter,
        child: CircularProgressIndicator(color: Palette.primary,),
      ),
    );
  }
}
