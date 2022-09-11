import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../l10n/l10n.dart';
import 'core/router/router.dart';
import 'core/theme/app_theme.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
class App extends ConsumerWidget {
  /// [App]
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.read(appThemeProvider);
    final router = ref.read(routerProvider);

    return  ScreenUtilInit(
      designSize: const Size(1284, 2778),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return MaterialApp.router(
           debugShowCheckedModeBanner : false,
          // TODO: add your app name here
          title: 'Formulaire',
          // TODO: add your localization here
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          // TODO: add your theme here
          theme: appTheme.lightTheme,
          darkTheme: appTheme.darkTheme,
          routeInformationParser: router.routeInformationParser,
          routeInformationProvider: router.routeInformationProvider,
          routerDelegate: router.routerDelegate,
        );
      }
    );
  }
}
