import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginProvider =
    StateNotifierProvider.autoDispose<LoginStateNotifier, Map<String, dynamic>>(
        (ref) {
  return LoginStateNotifier();
});

class LoginStateNotifier extends StateNotifier<Map<String, dynamic>> {
  LoginStateNotifier() : super({});

  Future<void> setValue({required String key, dynamic value}) async {
    final stateMap = {...state};
    stateMap[key] = value;
    state = stateMap;
  }
}
