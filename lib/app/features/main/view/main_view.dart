import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hall_of_fame/app/features/main/providers/main_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:hall_of_fame/app/core/theme/style.dart';
import 'package:hall_of_fame/app/features/main/data/months.dart';
import 'package:hall_of_fame/app/features/main/data/years.dart';
import 'package:hall_of_fame/app/features/main/widget/widgets.dart';
import 'package:hall_of_fame/l10n/l10n.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:queen_validators/queen_validators.dart';

import '../../../core/theme/palette.dart';
import '../data/days.dart';
import '../model/main_model.dart';

class MainView extends ConsumerStatefulWidget {
  const MainView({super.key});

  static const routeName = '/';

  @override
  ConsumerState<MainView> createState() => _MainViewState();
}

class _MainViewState extends ConsumerState<MainView> {
  final day = "1";

  final liens = [
    'Familiale',
    'Amicale',
    'Aucun',
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    // init();
  }

  String jourNaissance = "1";
  String jourDeces = "1";
  String jourEnregistrement = "1";
  String moisNaissance = "1";
  String moisDeces = "1";
  String moisEnregistrement = "1";
  String anneeNaissance = "1943";
  String anneeDeces = "1943";
  String anneeEnregistrement = "1943";
  String pays = "";
  String link = "Familiale";
  final nameController = TextEditingController();

  final titleController = TextEditingController();

  final bioController = TextEditingController();

  final submitController = TextEditingController();

  final telController = TextEditingController();

  final confirmTelController = TextEditingController();

  final emailController = TextEditingController();

  final confirmEmailController = TextEditingController();

  final countries = ['Cameroun', 'Gabon', 'Congo', 'Tchad', 'Tchad'];

  final _formKey = GlobalKey<FormState>();

  late PageController pageController;

  @override
  Widget build(BuildContext context) {
    final database = ref.read(databaseProvider.state);
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(isDarkMode
                ? 'assets/images/dark_bg.jpg'
                : 'assets/images/light_bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.fromLTRB(93.w, 130.h, 93.w, 30.h),
        child: Form(
          key: _formKey,
          child: PageView(
            controller: pageController,
            children: [
              SingleChildScrollView(
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
                          color: isDarkMode ? Palette.primary : Palette.black,
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.formulaireDeNomination,
                          style: isDarkMode
                              ? Style.gothamMedium
                              : Style.primaryGothamMedium,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 124.h,
                    ),
                    MainField(
                      title: AppLocalizations.of(context)!.nomDuCandidat,
                      hint: AppLocalizations.of(context)!.nomsEtPrenoms,
                      controller: nameController,
                    ),
                    SizedBox(height: 74.8.h),
                    MainField(
                      hint: AppLocalizations.of(context)!
                          .selectionnerLeDomaineDeRealisation,
                      title: AppLocalizations.of(context)!.titreOuProfession,
                      controller: titleController,
                    ),
                    SizedBox(
                      height: 109.h,
                    ),
                    Text(
                        AppLocalizations.of(context)!.dateDeNaissanceDuCandidat,
                        style: Style.whiteGothamMedium),
                    SizedBox(
                      height: 17.h,
                    ),
                    Row(
                      children: [
                        DateField(
                          hint: AppLocalizations.of(context)!.jour,
                          items: days,
                          value: jourNaissance,
                        ),
                        SizedBox(width: 114.w),
                        DateField(
                          hint: AppLocalizations.of(context)!.mois,
                          value: moisNaissance,
                          items: months,
                        ),
                        SizedBox(width: 93.4.w),
                        DateField(
                          hint: AppLocalizations.of(context)!.annee,
                          items: years,
                          value: anneeNaissance,
                        ),
                      ],
                    ),
                    SizedBox(height: 109.h),
                    Text(
                        AppLocalizations.of(context)!
                            .dateDeDecesDuCandidatLeCasEcheant,
                        style: isDarkMode
                            ? Style.whiteGothamMedium
                            : Style.gothamMedium),
                    SizedBox(height: 18.h),
                    Row(
                      children: [
                        DateField(
                          hint: AppLocalizations.of(context)!.jour,
                          items: days,
                          value: jourDeces,
                        ),
                        SizedBox(width: 114.w),
                        DateField(
                          hint: AppLocalizations.of(context)!.mois,
                          items: months,
                          value: moisDeces,
                        ),
                        SizedBox(width: 93.4.w),
                        DateField(
                          hint: AppLocalizations.of(context)!.annee,
                          items: years,
                          value: anneeDeces,
                        )
                      ],
                    ),
                    SizedBox(height: 86.h),
                    Text(AppLocalizations.of(context)!.biographieDuCandidat,
                        style: isDarkMode
                            ? Style.whiteGothamMedium
                            : Style.gothamMedium),
                    SizedBox(height: 12.h),
                    Container(
                      width: 1090.34.w,
                      height: 685.44.h,
                      padding: EdgeInsets.symmetric(horizontal: 21.w),
                      decoration: BoxDecoration(
                        color: isDarkMode ? Palette.dark : Palette.lightPrimary,
                        borderRadius: BorderRadius.circular(32.34.r),
                        border: Border.all(color: Palette.primary),
                      ),
                      child: TextFormField(
                        controller: bioController,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        style: isDarkMode
                            ? Style.whiteGothamMedium
                            : Style.gothamMedium,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 86.h),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    MainField(
                      controller: submitController,
                      title:
                          AppLocalizations.of(context)!.candidatureSoumisePar,
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
                          value: jourEnregistrement,
                        ),
                        SizedBox(width: 114.w),
                        DateField(
                          hint: AppLocalizations.of(context)!.mois,
                          items: months,
                          value: moisEnregistrement,
                        ),
                        SizedBox(width: 93.4.w),
                        DateField(
                          hint: AppLocalizations.of(context)!.annee,
                          items: years,
                          value: anneeEnregistrement,
                        )
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
                      value: link,
                    ),
                    SizedBox(height: 63.h),
                    Text(AppLocalizations.of(context)!.votrePays,
                        style: Style.whiteGothamMedium),
                    SizedBox(height: 15.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 29.w),
                      decoration: BoxDecoration(
                          color:
                              isDarkMode ? Palette.dark : Palette.lightPrimary,
                          border: Border.all(color: Palette.primary),
                          borderRadius: BorderRadius.circular(32.34.r)),
                      child: CountryPickerDropdown(
                        onValuePicked: (value) {
                          Fluttertoast.showToast(msg: value.name);
                          pays = value.name;
                        },
                        hint: Text(
                          AppLocalizations.of(context)!.selectionnerVotrePays,
                          style: Style.gothamLight,
                        ),
                        itemBuilder: (country) => Text(
                          country.name,
                          style: isDarkMode
                              ? Style.whiteGothamLigh
                              : Style.gothamLight,
                        ),
                        isExpanded: true,
                        dropdownColor:
                            isDarkMode ? Palette.dark : Palette.white,
                      ),
                    ),
                    SizedBox(
                      height: 49.h,
                    ),
                    Text(AppLocalizations.of(context)!.numeroDeTelephone,
                        style: Style.whiteGothamMedium),
                    SizedBox(
                      height: 15.h,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 29.w,
                      ),
                      decoration: BoxDecoration(
                          color:
                              isDarkMode ? Palette.dark : Palette.lightPrimary,
                          border: Border.all(color: Palette.primary),
                          borderRadius: BorderRadius.circular(32.34.r)),
                      child: IntlPhoneField(
                        showDropdownIcon: false,
                        controller: telController,
                        textAlignVertical: TextAlignVertical.center,
                        pickerDialogStyle: PickerDialogStyle(
                          backgroundColor:
                              isDarkMode ? Palette.dark : Palette.white,
                          countryCodeStyle: isDarkMode
                              ? Style.whiteGothamLigh
                              : Style.gothamLight,
                          countryNameStyle: isDarkMode
                              ? Style.whiteGothamLigh
                              : Style.gothamLight,
                        ),
                        style: isDarkMode
                            ? Style.whiteGothamLigh
                            : Style.gothamLight,
                        dropdownTextStyle: isDarkMode
                            ? Style.whiteGothamLigh
                            : Style.gothamLight,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          isDense: true,
                        ),
                      ),
                    ),
                    SizedBox(height: 49.h),
                    Text(
                      AppLocalizations.of(context)!
                          .confirmerLeNumeroDeTelephone,
                      style: isDarkMode
                          ? Style.whiteGothamMedium
                          : Style.gothamMedium,
                    ),
                    SizedBox(height: 12.h),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 29.w,
                      ),
                      decoration: BoxDecoration(
                          color:
                              isDarkMode ? Palette.dark : Palette.lightPrimary,
                          border: Border.all(color: Palette.primary),
                          borderRadius: BorderRadius.circular(32.34.r)),
                      child: IntlPhoneField(
                        showDropdownIcon: false,
                        controller: confirmTelController,
                        validator: (value) {
                          if (value == null) {
                            return "Veillez entrer des valeurs";
                          }
                          if (value.completeNumber != telController.text) {
                            return "Les deux numeros ne correspondent pas";
                          }
                          return null;
                        },
                        textAlignVertical: TextAlignVertical.center,
                        pickerDialogStyle: PickerDialogStyle(
                          backgroundColor:
                              isDarkMode ? Palette.dark : Palette.white,
                          countryCodeStyle: isDarkMode
                              ? Style.whiteGothamLigh
                              : Style.gothamLight,
                          countryNameStyle: isDarkMode
                              ? Style.whiteGothamLigh
                              : Style.gothamLight,
                        ),
                        style: isDarkMode
                            ? Style.whiteGothamLigh
                            : Style.gothamLight,
                        dropdownTextStyle: isDarkMode
                            ? Style.whiteGothamLigh
                            : Style.gothamLight,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          isDense: true,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 66.7.h,
                    ),
                    MainField(
                        hint: AppLocalizations.of(context)!
                            .veuillezEntrerVotreAdresseEmail,
                        controller: emailController,
                        validator: const IsEmail(),
                        title: AppLocalizations.of(context)!.adresseEmail),
                    SizedBox(
                      height: 40.h,
                    ),
                    MainField(
                        hint: AppLocalizations.of(context)!
                            .veuillezConfirmerVotreAdresseEmail,
                        controller: confirmEmailController,
                        validator: IsRequired(),
                        confirm: emailController,
                        title: AppLocalizations.of(context)!
                            .confirmerLadresseMail),
                    SizedBox(
                      height: 122.7.h,
                    ),
                    Center(
                      child: OutlinedButton(
                        onPressed: () async {
                          setState(() {});
                          if (!_formKey.currentState!.validate()) {
                            Fluttertoast.showToast(
                              msg: "something Went Wrong",
                              backgroundColor: Palette.failed,
                            );
                          } else {
                            Fluttertoast.showToast(
                              msg: "SuccessFully checked",
                              backgroundColor: Palette.success,
                            );
                            final model = MainModel(
                                noms: nameController.text,
                                profession: titleController.text,
                                dateDeNaissance: DateTime(
                                    int.parse(anneeNaissance),
                                    int.parse(moisNaissance),
                                    int.parse(jourNaissance)),
                                dateDeDeces: DateTime(int.parse(anneeDeces),
                                    int.parse(moisDeces), int.parse(jourDeces)),
                                bioGraphie: bioController.text,
                                soumisPar: submitController.text,
                                dateEnregistrement: DateTime(
                                  int.parse(anneeEnregistrement),
                                  int.parse(moisEnregistrement),
                                  int.parse(jourDeces),
                                ),
                                lienAvecLeCandidat: link,
                                pays: pays,
                                numeroDeTelephone: telController.text,
                                email: emailController.text);
                            if (await database.state.createForm(model)) {
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.success,
                                animType: AnimType.scale,
                                title: 'Felicitation',
                                desc: 'Vos response ont bien été enregistrer',
                                btnOkOnPress: () {},
                              ).show();

                              setState(() {
                                reset();
                                pageController.previousPage(
                                    duration: Duration(seconds:1 ), curve: Curves.bounceOut);
                              });
                            } else {
                              Fluttertoast.showToast(msg: "echec");
                            }
                          }
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Palette.primary,
                          shape: const StadiumBorder(),
                          side: BorderSide.none,
                          textStyle: Style.gothamMedium,
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.enregistrerEtEnvoyer,
                          style: Style.gothamMedium,
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
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    titleController.dispose();
    bioController.dispose();
    submitController.dispose();
    telController.dispose();
    confirmTelController.dispose();
    emailController.dispose();
    confirmEmailController.dispose();
  }

  void reset() {
    jourNaissance = "1";
    jourDeces = "1";
    jourEnregistrement = "1";
    moisNaissance = "1";
    moisDeces = "1";
    moisEnregistrement = "1";
    anneeNaissance = "1943";
    anneeDeces = "1943";
    anneeEnregistrement = "1943";
    pays = "";
    link = "Familiale";
    nameController.clear();
    titleController.clear();
    bioController.clear();
    submitController.clear();
    telController.clear();
    confirmTelController.clear();
    emailController.clear();
    confirmEmailController.clear();
  }
}
