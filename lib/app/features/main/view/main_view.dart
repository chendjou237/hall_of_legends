import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:hall_of_fame/app/core/theme/style.dart';
import 'package:hall_of_fame/app/features/main/data/months.dart';
import 'package:hall_of_fame/app/features/main/data/years.dart';
import 'package:hall_of_fame/app/features/main/widget/widgets.dart';
import 'package:hall_of_fame/l10n/l10n.dart';

import '../../../core/theme/palette.dart';
import '../data/days.dart';

class MainView extends ConsumerWidget {
  /// TODO add your comment here
  MainView({super.key});

  static const routeName = '/';
  final day = "1";
  final liens = [
    'famille',
    'amis',
    'connaisance',
  ];

  final countries = ['Cameroun', 'Gabon', 'Congo', 'Tchad', 'Tchad'];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
     var brightness = MediaQuery.of(context).platformBrightness;
 bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration:  BoxDecoration(
          image: DecorationImage(
            image:  AssetImage( isDarkMode?'assets/images/dark_bg.jpg': 'assets/images/light_bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 135.h, horizontal: 93.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                    'assets/images/logo_Hall-Of-Legends-foundation-white.png',
                    width: 584.23.w,
                    height: 243.h),
              ),
              SizedBox(height: 139.h),
              Center(
                child: Container(
                  alignment: Alignment.center,
                  width: 942.w,
                  height: 117.h,
                  decoration: BoxDecoration(
                    color: isDarkMode ?Palette.primary: Palette.black,
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.formulaireDeNomination,
                    style: isDarkMode? Style.gothamMedium: Style.primaryGothamMedium,
                  ),
                ),
              ),
              SizedBox(
                height: 124.h,
              ),
              MainField(
                title: AppLocalizations.of(context)!.nomDuCandidat,
                hint: AppLocalizations.of(context)!.nomsEtPrenoms,
              ),
              SizedBox(height: 74.8.h),
              MainField(
                  hint: AppLocalizations.of(context)!
                      .selectionnerLeDomaineDeRealisation,
                  title: AppLocalizations.of(context)!.titreOuProfession),
              SizedBox(
                height: 109.h,
              ),
              Text(AppLocalizations.of(context)!.dateDeNaissanceDuCandidat,
                  style: Style.whiteGothamMedium),
              SizedBox(
                height: 17.h,
              ),
              Row(
                children: [
                  DateField(
                    hint: AppLocalizations.of(context)!.jour,
                    items: days,
                    onChange: (val) {},
                  ),
                  SizedBox(width: 114.w),
                  DateField(
                      hint: AppLocalizations.of(context)!.mois,
                      items: months,
                      onChange: (val) {}),
                  SizedBox(width: 93.4.w),
                  DateField(
                      hint: AppLocalizations.of(context)!.annee,
                      items: years,
                      onChange: (val) {})
                ],
              ),
              SizedBox(height: 109.h),
              Text(
                  AppLocalizations.of(context)!
                      .dateDeDecesDuCandidatLeCasEcheant,
                  style: isDarkMode? Style.whiteGothamMedium: Style.gothamMedium),
              SizedBox(height: 18.h),
              Row(
                children: [
                  DateField(
                    hint: AppLocalizations.of(context)!.jour,
                    items: days,
                    onChange: (val) {},
                  ),
                  SizedBox(width: 114.w),
                  DateField(
                      hint: AppLocalizations.of(context)!.mois,
                      items: months,
                      onChange: (val) {}),
                  SizedBox(width: 93.4.w),
                  DateField(
                      hint: AppLocalizations.of(context)!.annee,
                      items: years,
                      onChange: (val) {})
                ],
              ),
              SizedBox(height: 86.h),
              Text(AppLocalizations.of(context)!.biographieDuCandidat,
                  style: isDarkMode? Style.whiteGothamMedium : Style.gothamMedium),
              SizedBox(height: 12.h),
              Container(
                width: 1090.34.w,
                height: 685.44.h,
                decoration: BoxDecoration(
                  color: isDarkMode? Palette.dark: Palette.lightPrimary,
                  borderRadius: BorderRadius.circular(32.34.r),
                  border: Border.all(color: Palette.primary),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 86.h),
              MainField(
                title: AppLocalizations.of(context)!.candidatureSoumisePar,
                hint: AppLocalizations.of(context)!.nomsEtPrenoms,
              ),
              SizedBox(height: 78.h),
              Text(
                AppLocalizations.of(context)!.dateDenregistrement,
                style: Style.whiteGothamMedium,
              ),
              SizedBox(
                height: 28.h,
              ),
              Row(
                children: [
                  DateField(
                    hint: AppLocalizations.of(context)!.jour,
                    items: days,
                    onChange: (val) {},
                  ),
                  SizedBox(width: 114.w),
                  DateField(
                      hint: AppLocalizations.of(context)!.mois,
                      items: months,
                      onChange: (val) {}),
                  SizedBox(width: 93.4.w),
                  DateField(
                      hint: AppLocalizations.of(context)!.annee,
                      items: years,
                      onChange: (val) {})
                ],
              ),
              SizedBox(height: 109.h),
              Text(
                AppLocalizations.of(context)!.lienAvecLeCandidat,
                style: Style.whiteGothamMedium,
              ),
              SizedBox(
                height: 15.6.h,
              ),
              HallDropDown(
                items: liens,
                hint: AppLocalizations.of(context)!
                    .selectionnerVotreLienAvecLeCandidat,
              ),
              SizedBox(height: 63.h),
              Text(AppLocalizations.of(context)!.votrePays,
                  style: Style.whiteGothamMedium),
              SizedBox(height: 15.h),
              HallDropDown(
                  items: countries,
                  hint: AppLocalizations.of(context)!.selectionnerVotrePays),
              SizedBox(height: 61.h),
              MainField(
                  hint: AppLocalizations.of(context)!
                      .veuillezEntrerVotreNumeroDeTelephone,
                  title: AppLocalizations.of(context)!.numeroDeTelephone),
              SizedBox(height: 49.h),
              MainField(
                  hint: AppLocalizations.of(context)!
                      .veuillezConfirmerVotreNumeroDeTelephone,
                  title: AppLocalizations.of(context)!
                      .confirmerLeNumeroDeTelephone),
              SizedBox(
                height: 66.7.h,
              ),
              MainField(
                  hint: AppLocalizations.of(context)!
                      .veuillezEntrerVotreAdresseEmail,
                  title: AppLocalizations.of(context)!.adresseEmail),
              SizedBox(
                height: 40.h,
              ),
              MainField(
                  hint: AppLocalizations.of(context)!
                      .veuillezConfirmerVotreAdresseEmail,
                  title: AppLocalizations.of(context)!.confirmerLadresseMail),
              SizedBox(
                height: 122.7.h,
              ),
              Center(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                   
                    backgroundColor: Palette.primary,
                    shape: const StadiumBorder(),
                    side: BorderSide.none,
                    textStyle: Style.gothamMedium,
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.enregistrerEtEnvoyer,
                    style:
                        Style.gothamMedium,
                  ),
                ),
              ),
              SizedBox(
                height: 225.h,
              ),
              Center(
                child: Image.asset(
                  'assets/images/logo_Hall-Of-Legends-white.png',
                  width: 329.81.w,
                  height: 136.43.h,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
