// ignore_for_file: must_be_immutable, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../function.dart';
import '../../../style/colors.dart';
import '../../../style/text_style.dart';
import '../../_components/select_panel.dart';
import '../../_components/select_panel_const_value.dart';
import '../../_components/user_select_checkbox.dart';
import '../viewmodel/consultation_user_select_value_viewmodel.dart';
import '../viewmodel/consultation_user_text_value_viewmodel.dart';

class DentalInput extends ConsumerWidget {
  DentalInput({
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

    final consultationUserSelectValueViewModel =
        ref.watch(consultationUserSelectValueProvider.notifier);

    final consultationDentalCheckDecayUntreatedState =
        ref.watch(consultationDentalCheckDecayUntreatedProvider);
    final consultationDentalCheckDecayTreatedState =
        ref.watch(consultationDentalCheckDecayTreatedProvider);

    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: const BoxDecoration(color: Colors.white),
      child: ExpansionTile(
        title: Text(
          '歯科入力',
          style: IHSTextStyle.small,
        ),
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16),
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
                  child: const Text('歯科所見'),
                ),

                //むし歯の状態
                const SizedBox(height: 16),
                const Text('むし歯の状態'),
                SelectPanel(
                  valueList: SelectPanelConstValue().dentalCheckDecayValueList,
                  value: getValue(
                    selectValues: selectValues,
                    state: consultationUserSelectValueState,
                    name: 'dental_check_decay',
                    minus: 0,
                  ),
                  width: size.width - 32,
                  selectName: 'dental_check_decay',
                ),

                //未処置のむし歯の本数
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      child: Text('未処置のむし歯の本数'),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 80,
                            child: TextField(
                              controller:
                                  consultationDentalCheckDecayUntreatedState,
                              style: IHSTextStyle.small,
                              decoration: const InputDecoration(
                                fillColor:
                                    IHSColors.consultationInputBackgroundColor,
                                filled: true,
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.all(8),
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          const SizedBox(width: 20),
                          const Text('本'),
                        ],
                      ),
                    ),
                  ],
                ),

                //処置済のむし歯の本数
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      child: Text('処置済のむし歯の本数'),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 80,
                            child: TextField(
                              controller:
                                  consultationDentalCheckDecayTreatedState,
                              style: IHSTextStyle.small,
                              decoration: const InputDecoration(
                                fillColor:
                                    IHSColors.consultationInputBackgroundColor,
                                filled: true,
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.all(8),
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          const SizedBox(width: 20),
                          const Text('本'),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                UserSelectCheckbox(
                  selectValues: selectValues,
                  title: '歯肉・粘膜',
                  name: 'is_dental_gingiva',
                ),

                const SizedBox(height: 16),

                UserSelectCheckbox(
                  selectValues: selectValues,
                  title: 'かみ合わせ',
                  name: 'is_dental_engagement',
                ),

                const SizedBox(height: 16),

                const Text('判定'),

                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: IHSColors.consultationInputBackgroundColor,
                    border: Border.all(color: Colors.black54),
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 24,
                    ),
                    child: DropdownButton(
                      isExpanded: true,
                      underline: Container(),
                      hint: const Text('選択してください'),
                      items: SelectPanelConstValue()
                          .resultPulldownValues4
                          .map((result) {
                        return DropdownMenuItem(
                          child: Text(
                            result,
                            style: IHSTextStyle.small,
                          ),
                          value: result,
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        consultationUserSelectValueViewModel.setValue(
                          key: 'dental_check_result',
                          value: value,
                        );
                      },
                      value: getPulldownValue(
                        selectValues: selectValues,
                        state: consultationUserSelectValueState,
                        name: 'dental_check_result',
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
