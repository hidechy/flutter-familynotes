import 'package:family_notes/screens/child/viewmodel/child_user_select_value_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../style/colors.dart';
import '../consultation/viewmodel/consultation_select_value_viewmodel.dart';
import '../consultation/viewmodel/consultation_user_select_value_viewmodel.dart';
import '../parent_report/viewmodel/parent_report_user_select_value_viewmodel.dart';
import 'select_panel_viewmodel_parent_class.dart';

class SelectPanel extends ConsumerWidget {
  const SelectPanel(
      {Key? key,
      required this.valueList,
      required this.value,
      required this.width,
      required this.selectName})
      : super(key: key);
  final List<Map<String, String>> valueList;
  final int value;
  final double width;
  final String selectName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final consultationSelectValueState =
        ref.watch(consultationSelectValueProvider);

    /////////////////////////////////////////
    //consultationとparentReportで使用するviewmodelを使い分けるために親クラスを作成した
    // lib/screens/_components/select_panel_viewmodel_parent_class.dart

    var viewModel = UserSelectViewModelParentClass();

    switch (consultationSelectValueState) {
      case 'consultationInput':
        viewModel = ref.watch(consultationUserSelectValueProvider.notifier);
        break;

      case 'parentReportInput':
        viewModel = ref.watch(parentReportUserSelectValueProvider.notifier);
        break;

      case 'childInput':
        viewModel = ref.watch(childUserSelectValueProvider.notifier);
        break;
    }
    /////////////////////////////////////////

    final oneWidth = (width / valueList.length) - 15;

    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(border: Border.all(color: Colors.black54)),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: valueList.length,
        itemBuilder: (context, index) {
          //パネルの個々の選択肢
          return GestureDetector(
            onTap: () {
              final selectValue = valueList[index]['key'];

              if (selectValue != null) {
                viewModel.setValue(
                  key: selectName,
                  value: int.parse(selectValue),
                );
              }
            },
            child: Container(
              width: oneWidth,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                //TODO　パネル色変更部分
                color: (value == index)
                    ? IHSColors.selectPanelBackgroundColor1
                    : Colors.white,
                //TODO　パネル色変更部分

                border: Border(
                  right: (index < valueList.length - 1)
                      ? const BorderSide(color: Colors.black54)
                      : const BorderSide(),
                ),
              ),

//TODO 暫定的に数値も表示
//              child: Text(valueList[index]["value"]!),
              child: Text(
                "${valueList[index]["value"]}(${valueList[index]["key"]})",
              ),
            ),
          );
        },
      ),
    );
  }
}
