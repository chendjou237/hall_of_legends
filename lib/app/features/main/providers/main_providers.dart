
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:hall_of_fame/app/features/main/services/database.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final databaseProvider = StateProvider<Database>((ref) {
  return Database(db: FirebaseFirestore.instance, read: ref.read);
});

final formKeyProvider = StateProvider<GlobalKey<FormState>>((ref) {
  return GlobalKey<FormState>();
});

final linkProvider = StateProvider<String?>((ref) {
  return ;
});