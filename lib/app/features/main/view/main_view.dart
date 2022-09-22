import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:queen_validators/queen_validators.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:hall_of_fame/app/core/theme/style.dart';
import 'package:hall_of_fame/app/features/main/data/months.dart';
import 'package:hall_of_fame/app/features/main/data/years.dart';
import 'package:hall_of_fame/app/features/main/providers/main_providers.dart';
import 'package:hall_of_fame/app/features/main/widget/widgets.dart';
import 'package:hall_of_fame/l10n/l10n.dart';

import '../../../core/theme/palette.dart';
import '../data/days.dart';
import '../model/main_model.dart';
import '../providers/date_provider.dart';

class MainView extends ConsumerStatefulWidget {
  const MainView({super.key});

  static const routeName = '/home';

  @override
  ConsumerState<MainView> createState() => _MainViewState();
}

class _MainViewState extends ConsumerState<MainView> {
  final day = "1";

  @override
  void initState() {
    super.initState();
    pageController = PageController();

    // init();
  }

  final Uri _url = Uri.parse('https://halloflegends.online/');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  bool _isLoading = false;

  String? _jourNaissance;
  String jourDeces = "1";
  String jourEnregistrement = "1";
  String moisNaissance = "1";
  String moisDeces = "1";
  String moisEnregistrement = "1";
  String anneeNaissance = "1943";
  String anneeDeces = "1943";
  String anneeEnregistrement = "1943";
  String pays = "";
  String link = "Famille";
  final nameController = TextEditingController();

  final titleController = TextEditingController();

  final bioController = TextEditingController();

  final submitController = TextEditingController();

  final telController = TextEditingController();

  final confirmTelController = TextEditingController();

  final emailController = TextEditingController();

  final confirmEmailController = TextEditingController();

  final countries = ['Cameroun', 'Gabon', 'Congo', 'Tchad', 'Tchad'];

  final _firstFormKey = GlobalKey<FormState>();
  final _secondFormKey = GlobalKey<FormState>();

  late PageController pageController;

  @override
  Widget build(BuildContext context) {
    final liens = [AppLocalizations.of(context)!.famille, AppLocalizations.of(context)!.amicale, AppLocalizations.of(context)!.aucun];
    final database = ref.read(databaseProvider.state);
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    final jourD = ref.watch(jourDProvider.notifier);
    final moisD = ref.watch(moisDProvider.notifier);
    final anneeD = ref.watch(anneeDProvider.notifier);
    final jourN = ref.watch(jourNProvider.notifier);
    final moisN = ref.watch(moisNProvider.notifier);
    final anneeN = ref.watch(anneeNProvider.notifier);
    final jourE = ref.watch(jourEProvider.notifier);
    final moisE = ref.watch(moisEProvider.notifier);
    final anneeE = ref.watch(anneeEProvider.notifier);
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
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: [
            GestureDetector(
              onHorizontalDragStart: (drag) {
                if (_firstFormKey.currentState!.validate()) {
                  pageController.nextPage(
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeIn);
                } else {
                  //TODO: loc
                  Fluttertoast.showToast(
                      msg: "please field required field",
                      backgroundColor: Colors.red);
                }
              },
              child: SingleChildScrollView(
                child: Form(
                  key: _firstFormKey,
                  autovalidateMode: AutovalidateMode.always,
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
                            AppLocalizations.of(context)!
                                .formulaireDeNomination,
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
                          AppLocalizations.of(context)!
                              .dateDeNaissanceDuCandidat,
                          style: isDarkMode
                              ? Style.whiteGothamMedium
                              : Style.gothamMedium),
                      SizedBox(
                        height: 17.h,
                      ),
                      Row(
                        children: [
                          DateField(
                            hint: AppLocalizations.of(context)!.jour,
                            items: days,
                            value: jourN,
                          ),
                          SizedBox(width: 114.w),
                          DateField(
                            hint: AppLocalizations.of(context)!.mois,
                            items: months,
                            value: moisN,
                          ),
                          SizedBox(width: 93.4.w),
                          DateField(
                            hint: AppLocalizations.of(context)!.annee,
                            items: years,
                            value: anneeN,
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
                            value: jourD,
                          ),
                          SizedBox(width: 114.w),
                          DateField(
                            hint: AppLocalizations.of(context)!.mois,
                            items: months,
                            value: moisD,
                          ),
                          SizedBox(width: 93.4.w),
                          DateField(
                            hint: AppLocalizations.of(context)!.annee,
                            items: years,
                            value: anneeD,
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
                          color:
                              isDarkMode ? Palette.dark : Palette.lightPrimary,
                          borderRadius: BorderRadius.circular(32.34.r),
                          border: Border.all(color: Palette.primary),
                        ),
                        child: TextFormField(
                          controller: bioController,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          style: (isDarkMode
                                  ? Style.whiteGothamLight
                                  : Style.darkGothamLight)
                              .copyWith(height: 4.h),
                          cursorColor:
                              isDarkMode ? Palette.hintColor : Palette.dark,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusColor: Palette.hintColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 86.h),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onHorizontalDragEnd: (drag) {
                pageController.previousPage(
                    duration: const Duration(seconds: 1), curve: Curves.ease);
              },
              child: SingleChildScrollView(
                child: Form(
                  key: _secondFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                        style: isDarkMode
                            ? Style.whiteGothamMedium
                            : Style.gothamMedium,
                      ),
                      SizedBox(
                        height: 28.h,
                      ),
                      Row(
                        children: [
                          DateField(
                            hint: AppLocalizations.of(context)!.jour,
                            items: days,
                            value: jourE,
                          ),
                          SizedBox(width: 114.w),
                          DateField(
                            hint: AppLocalizations.of(context)!.mois,
                            items: months,
                            value: moisE,
                          ),
                          SizedBox(width: 93.4.w),
                          DateField(
                            hint: AppLocalizations.of(context)!.annee,
                            items: years,
                            value: anneeE,
                          )
                        ],
                      ),
                      SizedBox(height: 109.h),
                      Text(
                        AppLocalizations.of(context)!.lienAvecLeCandidat,
                        style: isDarkMode
                            ? Style.whiteGothamMedium
                            : Style.gothamMedium,
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
                          style: isDarkMode
                              ? Style.whiteGothamMedium
                              : Style.gothamMedium),
                      SizedBox(height: 15.h),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 29.w),
                        decoration: BoxDecoration(
                            color: isDarkMode
                                ? Palette.dark
                                : Palette.lightPrimary,
                            border: Border.all(color: Palette.primary),
                            borderRadius: BorderRadius.circular(32.34.r)),
                        child: CountryPickerDropdown(
                          onValuePicked: (value) {
                            Fluttertoast.showToast(msg: value.name);
                            pays = value.name;
                          },
                          hint: Text(
                            AppLocalizations.of(context)!.selectionnerVotrePays,
                            style: isDarkMode
                                ? Style.whiteGothamLight
                                : Style.darkGothamLight,
                          ),
                          itemBuilder: (country) => Text(
                            country.name,
                            style: isDarkMode
                                ? Style.whiteGothamLight
                                : Style.darkGothamLight,
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
                          style: isDarkMode
                              ? Style.whiteGothamMedium
                              : Style.gothamMedium),
                      SizedBox(
                        height: 15.h,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 29.w,
                        ),
                        decoration: BoxDecoration(
                            color: isDarkMode
                                ? Palette.dark
                                : Palette.lightPrimary,
                            border: Border.all(color: Palette.primary),
                            borderRadius: BorderRadius.circular(32.34.r)),
                        child: IntlPhoneField(
                          showDropdownIcon: false,
                          controller: telController,
                          onCountryChanged: (country) {
                            setState(() {
                              print(telController.text);
                            });
                          },
                          textAlignVertical: TextAlignVertical.center,
                          pickerDialogStyle: PickerDialogStyle(
                            backgroundColor:
                                isDarkMode ? Palette.dark : Palette.white,
                            countryCodeStyle: isDarkMode
                                ? Style.whiteGothamLight
                                : Style.darkGothamLight,
                            countryNameStyle: isDarkMode
                                ? Style.whiteGothamLight
                                : Style.darkGothamLight,
                          ),
                          style: isDarkMode
                              ? Style.whiteGothamLight
                              : Style.darkGothamLight,
                          dropdownTextStyle: isDarkMode
                              ? Style.whiteGothamLight
                              : Style.darkGothamLight,
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
                            ? Style.whiteGothamLight
                            : Style.darkGothamLight,
                      ),
                      SizedBox(height: 12.h),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 29.w,
                        ),
                        decoration: BoxDecoration(
                            color: isDarkMode
                                ? Palette.dark
                                : Palette.lightPrimary,
                            border: Border.all(color: Palette.primary),
                            borderRadius: BorderRadius.circular(32.34.r)),
                        child: IntlPhoneField(
                          showDropdownIcon: false,
                          controller: confirmTelController,
                          validator: (value) {
                            setState(() {
                              
                            });
                            if (value == null) {
                              return AppLocalizations.of(context)!
                                  .veuillezEntrerDesValeurs;
                            }
                            if (value.completeNumber != telController.text) {
                              return AppLocalizations.of(context)!
                                  .lesDeuxNumerosNeCorrespondentPas;
                            }
                            return null;
                          },
                          textAlignVertical: TextAlignVertical.center,
                          pickerDialogStyle: PickerDialogStyle(
                            backgroundColor:
                                isDarkMode ? Palette.dark : Palette.white,
                            countryCodeStyle: isDarkMode
                                ? Style.whiteGothamLight
                                : Style.darkGothamLight,
                            countryNameStyle: isDarkMode
                                ? Style.whiteGothamLight
                                : Style.darkGothamLight,
                          ),
                          style: isDarkMode
                              ? Style.whiteGothamLight
                              : Style.darkGothamLight,
                          dropdownTextStyle: isDarkMode
                              ? Style.whiteGothamLight
                              : Style.darkGothamLight,
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
                          validator:  IsEmail(AppLocalizations.of(context)!.emailError),
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
                        child: _isLoading
                            ? CircularProgressIndicator(
                                color: Palette.primary,
                              )
                            : OutlinedButton(
                                onPressed: () async {
                                  setState(() {
                                    _isLoading = true;
                                  });
                                  if (!_secondFormKey.currentState!.validate()) {
                                    Fluttertoast.showToast(
                                      msg: AppLocalizations.of(context)!
                                          .veuillezRemplirLesInformationsNecessaire,
                                      backgroundColor: Palette.failed,
                                    );
                                  } else {
                                    Fluttertoast.showToast(
                                      msg: AppLocalizations.of(context)!
                                          .verifieAvecSucces,
                                      backgroundColor: Palette.success,
                                    );
                                    final model = MainModel(
                                        noms: nameController.text,
                                        profession: titleController.text,
                                        dateDeNaissance: DateTime(
                                            int.parse(anneeN.state!),
                                            int.parse(moisN.state!),
                                            int.parse(jourN.state!)),
                                        dateDeDeces: DateTime(
                                            int.parse(anneeD.state!),
                                            int.parse(moisD.state!),
                                            int.parse(jourD.state!)),
                                        bioGraphie: bioController.text,
                                        soumisPar: submitController.text,
                                        dateEnregistrement: DateTime(
                                          int.parse(anneeE.state!),
                                          int.parse(moisE.state!),
                                          int.parse(jourE.state!),
                                        ),
                                        lienAvecLeCandidat: link,
                                        pays: pays,
                                        numeroDeTelephone: telController.text,
                                        email: emailController.text);
                                    if (await database.state
                                        .createForm(model)) {
                                      AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.success,
                                        animType: AnimType.scale,
                                        titleTextStyle: isDarkMode
                                            ? Style.primaryGothamMedium
                                            : Style.gothamMedium,
                                        descTextStyle: isDarkMode
                                            ? Style.whiteGothamMedium
                                            : Style.gothamMedium,
                                        title: AppLocalizations.of(context)!
                                            .felicitation,
                                        dialogBackgroundColor: isDarkMode
                                            ? Palette.dark
                                            : Palette.white,
                                        desc: AppLocalizations.of(context)!
                                            .vosResponseOntBienEteEnregistrer,
                                        btnOkOnPress: () {},
                                      ).show();

                                      setState(() {
                                        reset();
                                        pageController.previousPage(
                                            duration:
                                                const Duration(seconds: 1),
                                            curve: Curves.bounceOut);
                                      });
                                    } else {
                                      Fluttertoast.showToast(msg: "echec");
                                    }
                                  }
                                  setState(() {
                                    _isLoading = false;
                                  });
                                },
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Palette.primary,
                                  shape: const StadiumBorder(),
                                  side: BorderSide.none,
                                  textStyle: Style.gothamMedium,
                                ),
                                child: Text(
                                  AppLocalizations.of(context)!
                                      .enregistrerEtEnvoyer,
                                  style: isDarkMode
                                      ? Style.whiteGothamMedium
                                      : Style.gothamMedium,
                                ),
                              ),
                      ),
                      SizedBox(height: 42.h),
                      Center(
                        child: OutlinedButton(
                          onPressed: () async {
                            showConfidentialPolytics();
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shape: const StadiumBorder(),
                            side:
                                BorderSide(color: Palette.primary, width: 3.w),
                          ),
                          child: Text(
                            AppLocalizations.of(context)!.politics,
                            style: Style.whiteGothamLight
                                .copyWith(color: Palette.primary),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 111.h,
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
            )
          ],
        ),
      ),
    );
  }

  Future showConfidentialPolytics() async {
    await showModalBottomSheet(
      context: context,
      builder: (context) {
        var brightness = MediaQuery.of(context).platformBrightness;
        bool isDarkMode = brightness == Brightness.dark;

        return SafeArea(
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 100.h, horizontal: 32.w),
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(isDarkMode
                        ? 'assets/images/dark_bg.jpg'
                        : 'assets/images/light_bg.jpg'),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(width: 0),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(150.r),
                      topRight: Radius.circular(150.r))),
              height: MediaQuery.of(context).size.height * 0.6,
              child: Column(
                children: [
                  Text(
                    AppLocalizations.of(context)!.politics,
                    style: isDarkMode
                        ? Style.gothamMedium.copyWith(
                            color: Palette.white,
                            fontSize: 74.sp,
                            fontWeight: FontWeight.w600)
                        : Style.primaryGothamMedium.copyWith(
                            fontSize: 74.sp, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 42.h),
                  Text(
                    AppLocalizations.of(context)!.politicsText,
                    textAlign: TextAlign.center,
                    style: (isDarkMode
                            ? Style.whiteGothamMedium
                            : Style.gothamMedium)
                        .copyWith(height: 4.h),
                  ),
                  const Spacer(),
                  OutlinedButton(
                      onPressed: () async {
                        await _launchUrl();
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Palette.primary,
                        shape: const StadiumBorder(),
                        side: BorderSide.none,
                        textStyle: Style.gothamMedium,
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.voirPlus,
                        style: isDarkMode
                            ? Style.whiteGothamMedium
                            : Style.gothamMedium,
                      ))
                ],
              )),
        );
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(150.r),
          topRight: Radius.circular(150.r),
        ),
      ),
      isScrollControlled: true,
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
    _jourNaissance = "1";
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
