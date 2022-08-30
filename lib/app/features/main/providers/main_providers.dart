

import 'package:hall_of_fame/app/features/main/repository/main_repository.dart';
import 'package:hall_of_fame/app/features/main/repository/main_repository_impl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/firebase_collection/firebase_collection.dart';

final mainRepositoryProvider = Provider.autoDispose<MainRepository>((ref) {
  final firebaseCollection = ref.watch(firebaseCollectionProvider);
  return MainRepositoryImpl(firebaseCollection);
});
