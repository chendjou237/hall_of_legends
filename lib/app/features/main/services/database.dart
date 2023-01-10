// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hall_of_fame/app/features/main/model/main_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/theme/palette.dart';

class Database {
  final FirebaseFirestore db;
  final Reader read;
  Database({
    required this.db,
    required this.read,
  });

  Future<bool> createForm(MainModel model) async {
    try {
      await db.collection('formulaire').doc().set(model.toMap());
      return true;
    } on FirebaseException catch (err) {
      Fluttertoast.showToast(
          msg: err.message!, backgroundColor: Palette.failed);
      return false;
    }
  }
}
