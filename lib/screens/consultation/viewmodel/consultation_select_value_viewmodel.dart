import 'package:flutter_riverpod/flutter_riverpod.dart';

final consultationSelectValueProvider = StateNotifierProvider.autoDispose<
    ConsultationSelectValueStateNotifier, String>((ref) {
  return ConsultationSelectValueStateNotifier();
});

class ConsultationSelectValueStateNotifier extends StateNotifier<String> {
  ConsultationSelectValueStateNotifier() : super('');

  Future<void> setValue({required String value}) async {
    state = value;
  }
}
