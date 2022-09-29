// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../function.dart';
import '../../../style/text_style.dart';
import '../../_components/select_panel.dart';
import '../../_components/select_panel_const_value.dart';
import '../viewmodel/consultation_user_select_value_viewmodel.dart';

class UrinalysisInput extends ConsumerWidget {
  UrinalysisInput({
    Key? key,
    required this.selectValues,
    required this.consultationKind,
  }) : super(key: key);
  final Map<dynamic, dynamic> selectValues;
  final String consultationKind;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final consultationUserSelectValueState =
        ref.watch(consultationUserSelectValueProvider);

    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: DefaultTextStyle(
        style: IHSTextStyle.small,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 2, color: Colors.black54),
                ),
              ),
              child: const Text('尿検査'),
            ),

            //尿蛋白
            const SizedBox(height: 8),
            const Text('尿蛋白'),
            SelectPanel(
              valueList: SelectPanelConstValue().urinalysisValueList,
              value: getValue(
                selectValues: selectValues,
                state: consultationUserSelectValueState,
                name: 'urinalysis_protein',
                minus: 1,
              ),
              width: size.width,
              selectName: 'urinalysis_protein',
            ),

            //尿糖
            const SizedBox(height: 8),
            const Text('尿糖'),
            SelectPanel(
              valueList: SelectPanelConstValue().urinalysisValueList,
              value: getValue(
                selectValues: selectValues,
                state: consultationUserSelectValueState,
                name: 'urinalysis_sugar',
                minus: 1,
              ),
              width: size.width,
              selectName: 'urinalysis_sugar',
            ),

            //尿潜血
            const SizedBox(height: 8),
            const Text('尿潜血'),
            SelectPanel(
              valueList: SelectPanelConstValue().urinalysisValueList,
              value: getValue(
                selectValues: selectValues,
                state: consultationUserSelectValueState,
                name: 'urinalysis_occult_blood',
                minus: 1,
              ),
              width: size.width,
              selectName: 'urinalysis_occult_blood',
            ),
          ],
        ),
      ),
    );
  }
}
