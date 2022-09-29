// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../function.dart';
import '../../../style/colors.dart';
import '../../../style/text_style.dart';
import '../../_components/select_panel_const_value.dart';
import '../viewmodel/consultation_user_select_value_viewmodel.dart';
import '../viewmodel/consultation_user_text_value_viewmodel.dart';

class PrecisionInput extends ConsumerWidget {
  PrecisionInput(
      {Key? key, required this.selectValues, required this.consultationKind})
      : super(key: key);
  final String consultationKind;

  final Map<dynamic, dynamic> selectValues;

  late BuildContext _context;
  late WidgetRef _ref;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _context = context;
    _ref = ref;

    final consultationUserSelectValueState =
        ref.watch(consultationUserSelectValueProvider);

    final consultationUserSelectValueViewModel =
        ref.watch(consultationUserSelectValueProvider.notifier);

    final consultationPrecisionHealthCheckRequestedDateState =
        ref.watch(consultationPrecisionHealthCheckRequestedDateProvider);
    final consultationPrecisionHealthCheckDateState =
        ref.watch(consultationPrecisionHealthCheckDateProvider);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: const BoxDecoration(color: Colors.white),
      child: ExpansionTile(
        title: Text(
          '精密健康審査',
          style: IHSTextStyle.small,
        ),
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //精密検査依頼日
                const Text('精密検査依頼日'),

                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54),
                  ),
                  child: GestureDetector(
                    onTap: getPrecisionHealthCheckRequestedDate,
                    child: TextField(
                      enabled: false,
                      controller:
                          consultationPrecisionHealthCheckRequestedDateState,
                      style: IHSTextStyle.small,
                      decoration: const InputDecoration(
                        fillColor: IHSColors.consultationInputBackgroundColor,
                        filled: true,
                        contentPadding: EdgeInsets.all(8),
                      ),
                    ),
                  ),
                ),

                //精密検査依頼日
                const SizedBox(height: 16),

                const Text('精密検査受診日'),

                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54),
                  ),
                  child: GestureDetector(
                    onTap: getPrecisionHealthCheckDate,
                    child: TextField(
                      enabled: false,
                      controller: consultationPrecisionHealthCheckDateState,
                      style: IHSTextStyle.small,
                      decoration: const InputDecoration(
                        fillColor: IHSColors.consultationInputBackgroundColor,
                        filled: true,
                        contentPadding: EdgeInsets.all(8),
                      ),
                    ),
                  ),
                ),

                //結果
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
                          .resultPulldownValues3
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
                          key: 'precision_health_check_result',
                          value: value,
                        );
                      },
                      value: getPulldownValue(
                        selectValues: selectValues,
                        state: consultationUserSelectValueState,
                        name: 'precision_health_check_result',
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

  Future<void> getPrecisionHealthCheckRequestedDate() async {
    final consultationPrecisionHealthCheckRequestedDateState =
        _ref.watch(consultationPrecisionHealthCheckRequestedDateProvider);

    final pickedDate = getPickedDate(context: _context);

    await pickedDate.then((val) {
      consultationPrecisionHealthCheckRequestedDateState.text = val;
    });
  }

  Future<void> getPrecisionHealthCheckDate() async {
    final consultationPrecisionHealthCheckDateState =
        _ref.watch(consultationPrecisionHealthCheckDateProvider);

    final pickedDate = getPickedDate(context: _context);

    await pickedDate.then((val) {
      consultationPrecisionHealthCheckDateState.text = val;
    });
  }
}
