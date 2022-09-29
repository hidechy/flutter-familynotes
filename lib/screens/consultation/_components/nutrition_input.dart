// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../function.dart';
import '../../../style/text_style.dart';
import '../../_components/select_panel.dart';
import '../../_components/select_panel_const_value.dart';
import '../viewmodel/consultation_user_select_value_viewmodel.dart';

class NutritionInput extends ConsumerWidget {
  NutritionInput({
    Key? key,
    required this.selectValues,
    required this.consultationKind,
  }) : super(key: key);
  final Map<dynamic, dynamic> selectValues;
  final String consultationKind;

  late BuildContext _context;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _context = context;

    final consultationUserSelectValueState =
        ref.watch(consultationUserSelectValueProvider);

    final size = MediaQuery.of(_context).size;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: DefaultTextStyle(
        style: IHSTextStyle.small,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //表示、非表示
            if (['threeMonths'].contains(consultationKind))
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  const Text('栄養'),
                  SelectPanel(
                    valueList: SelectPanelConstValue().nutritionValueList,
                    value: getValue(
                      selectValues: selectValues,
                      state: consultationUserSelectValueState,
                      name: 'nutrition_method',
                      minus: 1,
                    ),
                    width: size.width,
                    selectName: 'nutrition_method',
                  ),
                ],
              ),

            //表示、非表示
            if (['onehalfYears'].contains(consultationKind))
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  const Text('母乳'),
                  SelectPanel(
                    valueList: SelectPanelConstValue().nutritionMilkValueList,
                    value: getValue(
                      selectValues: selectValues,
                      state: consultationUserSelectValueState,
                      name: 'nutrition_milk',
                      minus: 1,
                    ),
                    width: size.width,
                    selectName: 'nutrition_milk',
                  ),
                  const SizedBox(height: 8),
                  const Text('離乳'),
                  SelectPanel(
                    valueList:
                        SelectPanelConstValue().nutritionWeaningValueList,
                    value: getValue(
                      selectValues: selectValues,
                      state: consultationUserSelectValueState,
                      name: 'nutrition_weaning',
                      minus: 1,
                    ),
                    width: size.width,
                    selectName: 'nutrition_weaning',
                  ),
                ],
              ),

            const SizedBox(height: 8),

            const Text('栄養評価'),

            SelectPanel(
              valueList: SelectPanelConstValue().nutritionCheckValueList,
              value: getValue(
                selectValues: selectValues,
                state: consultationUserSelectValueState,
                name: 'nutrition_check',
                minus: 1,
              ),
              width: size.width,
              selectName: 'nutrition_check',
            ),
          ],
        ),
      ),
    );
  }
}
