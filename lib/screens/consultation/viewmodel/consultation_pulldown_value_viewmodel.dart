import 'package:flutter_riverpod/flutter_riverpod.dart';

final consultationPulldownValueProvider = StateNotifierProvider.autoDispose<
    ConsultationPulldownValueStateNotifier, String>((ref) {
  return ConsultationPulldownValueStateNotifier();
});

class ConsultationPulldownValueStateNotifier extends StateNotifier<String> {
  ConsultationPulldownValueStateNotifier() : super('');

  Future<void> setValue({required String value}) async {
    state = value;
  }
}
