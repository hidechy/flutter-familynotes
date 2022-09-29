import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../function.dart';
import '../../_components/family_notes_text_button.dart';
import '../../signin/viewmodel/login_viewmodel.dart';

class ConsentCheckbox extends ConsumerWidget {
  const ConsentCheckbox({
    Key? key,
    required this.title,
    required this.name,
  }) : super(key: key);
  final String title;
  final String name;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginProvider);

    final accountViewModel = ref.watch(loginProvider.notifier);

    final val = getValue(
      selectValues: {},
      state: loginState,
      name: name,
      minus: 0,
    );

    return Row(
      children: [
        IconButton(
          onPressed: () =>
              accountViewModel.setValue(key: name, value: (val == 0) ? 1 : 0),
          icon: Icon(
            (val == 0)
                ? Icons.check_box_outline_blank
                : Icons.check_box_outlined,
            size: 40,
          ),
        ),
        Expanded(
          child: TextButton(
              onPressed: () {},
              child: Container(
                alignment: Alignment.topLeft,
                child: FamilyNotesTextButton(
                  buttonTextLine1: title,
                  onPress: () {},
                ),
              )),
        ),
      ],
    );
  }
}
