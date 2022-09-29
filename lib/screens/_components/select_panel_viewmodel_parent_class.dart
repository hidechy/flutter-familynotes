import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserSelectViewModelParentClass
    extends StateNotifier<Map<dynamic, dynamic>> {
  UserSelectViewModelParentClass() : super({});

  Future<void> setValue({required String key, dynamic value}) async {}
}
