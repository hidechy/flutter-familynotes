// ignore_for_file: annotate_overrides

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../_components/select_panel_viewmodel_parent_class.dart';

final childUserSelectValueProvider = StateNotifierProvider.autoDispose<
    ChildUserSelectValueStateNotifier, Map<dynamic, dynamic>>((ref) {
  return ChildUserSelectValueStateNotifier();
});

class ChildUserSelectValueStateNotifier extends UserSelectViewModelParentClass {
  Future<void> setValue({required String key, dynamic value}) async {
    final stateMap = {...state};
    stateMap[key] = value;
    state = stateMap;
  }

  void stateClear() {
    state = {};
  }
}
