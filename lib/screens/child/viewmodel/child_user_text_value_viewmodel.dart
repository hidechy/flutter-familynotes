import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//
// //Lastname（姓）
// final childLastnameProvider = StateProvider.autoDispose((ref) {
//   return TextEditingController(text: '');
// });
//
// //Lastname（名）
// final childFirstnameProvider = StateProvider.autoDispose((ref) {
//   return TextEditingController(text: '');
// });
//
// //LastnameKana（姓ふりがな）
// final childLastnameKanaProvider = StateProvider.autoDispose((ref) {
//   return TextEditingController(text: '');
// });
//
// //LastnameKana（名ふりがな）
// final childFirstnameKanaProvider = StateProvider.autoDispose((ref) {
//   return TextEditingController(text: '');
// });
//
//

final childNicknameProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

final childBirthdayProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});
