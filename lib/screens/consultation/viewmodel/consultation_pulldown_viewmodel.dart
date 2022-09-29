import 'package:flutter_riverpod/flutter_riverpod.dart';

final consultationPulldownProvider = StateNotifierProvider.autoDispose
    .family<ConsultationPulldownStateNotifier, List<String>, String>((ref, cp) {
  return ConsultationPulldownStateNotifier()..getMenu(cp: cp);
});

class ConsultationPulldownStateNotifier extends StateNotifier<List<String>> {
  ConsultationPulldownStateNotifier() : super([]);

  Future<void> getMenu({required String cp}) async {
    switch (cp) {
      case 'parentReportInput':
        state = [
          '',
          '1か月児健康診査',
          '3〜4か月児健康診査',
          '6〜7か月児健康診査',
          '9〜10か月児健康診査',
          '1歳児健康診査',
          '1歳6か月児健康診査',
          '2歳児健康診査',
          '3歳児健康診査'
        ];

        break;
      case 'consultationInput':
        state = ['', '3〜4か月児健康診査', '1歳6か月児健康診査', '3歳児健康診査'];

        break;
    }
  }
}
