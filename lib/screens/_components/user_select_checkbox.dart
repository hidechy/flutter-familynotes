import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../function.dart';
import '../consultation/viewmodel/consultation_select_value_viewmodel.dart';
import '../consultation/viewmodel/consultation_user_select_value_viewmodel.dart';
import '../parent_report/viewmodel/parent_report_user_select_value_viewmodel.dart';
import 'select_panel_viewmodel_parent_class.dart';

class UserSelectCheckbox extends ConsumerWidget {
  const UserSelectCheckbox({
    Key? key,
    required this.selectValues,
    required this.title,
    required this.name,
  }) : super(key: key);
  final Map<dynamic, dynamic> selectValues;
  final String title;
  final String name;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final consultationSelectValueState =
        ref.watch(consultationSelectValueProvider);

    /////////////////////////////////////////
    //consultationとparentReportで使い分けるために親クラスを作成した
    // lib/screens/_components/select_panel_viewmodel_parent_class.dart

    var state = <dynamic, dynamic>{};

    var viewModel = UserSelectViewModelParentClass();

    switch (consultationSelectValueState) {
      case 'consultationInput':
        state = ref.watch(consultationUserSelectValueProvider);

        viewModel = ref.watch(consultationUserSelectValueProvider.notifier);
        break;

      case 'parentReportInput':
        state = ref.watch(parentReportUserSelectValueProvider);

        viewModel = ref.watch(parentReportUserSelectValueProvider.notifier);
        break;
    }
    /////////////////////////////////////////

    final val = getValue(
      selectValues: selectValues,
      state: state,
      name: name,
      minus: 0,
    );

    return Row(
      children: [
        Expanded(child: Text(title)),
        IconButton(
          onPressed: () =>
              viewModel.setValue(key: name, value: (val == 0) ? 1 : 0),
          icon: Icon(
            (val == 0)
                ? Icons.check_box_outline_blank
                : Icons.check_box_outlined,
            size: 40,
          ),
        ),
      ],
    );
  }
}
