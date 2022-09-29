// ignore_for_file: annotate_overrides

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../_components/select_panel_viewmodel_parent_class.dart';

final parentReportUserSelectValueProvider = StateNotifierProvider.autoDispose<
    ParentReportUserSelectValueStateNotifier, Map<dynamic, dynamic>>((ref) {
  return ParentReportUserSelectValueStateNotifier();
});

class ParentReportUserSelectValueStateNotifier
    extends UserSelectViewModelParentClass {
  Future<void> setValue({required String key, dynamic value}) async {
    final stateMap = {...state};
    stateMap[key] = value;
    state = stateMap;
  }

  void stateClear() {
    state = {};
  }
}
