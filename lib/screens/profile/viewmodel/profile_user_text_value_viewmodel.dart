import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileNicknameProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

final profileBirthdayProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

final profilePostalCodeProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

final profileAddressProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});
