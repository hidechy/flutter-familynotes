import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../style/colors.dart';
import '../parent_report/viewmodel/parent_report_user_select_value_viewmodel.dart';

class SelectPanelAnxietyChildRearing extends ConsumerWidget {
  const SelectPanelAnxietyChildRearing(
      {Key? key,
      required this.valueList,
      required this.value,
      required this.selectName})
      : super(key: key);
  final List<Map<String, String>> valueList;
  final int value;
  final String selectName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(parentReportUserSelectValueProvider.notifier);

    return Container(
      width: double.infinity,
      height: 40,
      decoration: const BoxDecoration(
        border: Border(
          left: BorderSide(color: Colors.black54),
        ),
      ),
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
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: (value == index)
                    ? IHSColors.selectPanelBackgroundColor1
                    : Colors.white,
                border: Border(
                  right: (index < valueList.length - 1)
                      ? const BorderSide(color: Colors.black54)
                      : const BorderSide(),
                  top: const BorderSide(color: Colors.black54),
                  bottom: const BorderSide(color: Colors.black54),
                ),
              ),
              child: Text(valueList[index]['value']!),
            ),
          );
        },
      ),
    );
  }
}
