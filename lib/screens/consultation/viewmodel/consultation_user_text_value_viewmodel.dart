import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final consultationDateProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

final consultationYearFromBirthProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

final consultationMonthFromBirthProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

final consultationHeightProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

final consultationWeightProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

final consultationHeadCircumferenceProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

final consultationChestCircumferenceProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

//
final consultationMemoProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

//
final consultationOphthalmicFindingsFollowupProvider =
    StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

final consultationEntFindingsFollowupProvider =
    StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

//
final consultationDentalCheckDecayUntreatedProvider =
    StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

final consultationDentalCheckDecayTreatedProvider =
    StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

//
final consultationPrecisionHealthCheckRequestedDateProvider =
    StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

final consultationPrecisionHealthCheckDateProvider =
    StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});
