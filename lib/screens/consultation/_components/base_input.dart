// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../function.dart';
import '../../../style/colors.dart';
import '../../../style/text_style.dart';
import '../viewmodel/consultation_user_select_value_viewmodel.dart';
import '../viewmodel/consultation_user_text_value_viewmodel.dart';

class BaseInput extends ConsumerWidget {
  BaseInput({
    Key? key,
    required this.consultationKind,
    required this.selectValues,
    required this.facilityPulldownValues,
  }) : super(key: key);
  final String consultationKind;

  final Map<dynamic, dynamic> selectValues;

  final List<String> facilityPulldownValues;

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

    //----------------------//
    final consultationDateState = ref.watch(consultationDateProvider);
    final consultationYearFromBirthState =
        ref.watch(consultationYearFromBirthProvider);
    final consultationMonthFromBirthState =
        ref.watch(consultationMonthFromBirthProvider);
    final consultationHeightState = ref.watch(consultationHeightProvider);
    final consultationWeightState = ref.watch(consultationWeightProvider);
    final consultationHeadCircumferenceState =
        ref.watch(consultationHeadCircumferenceProvider);
    final consultationChestCircumferenceState =
        ref.watch(consultationChestCircumferenceProvider);
    //----------------------//

    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: DefaultTextStyle(
        style: IHSTextStyle.small.copyWith(
          color: Colors.black,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 検診日

            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '検診日',
                    style: IHSTextStyle.small.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  const TextSpan(text: '　'),
                  TextSpan(
                    text: '※必須',
                    style: IHSTextStyle.xSmall.copyWith(
                      color: IHSColors.requireCautionColor,
                    ),
                  ),
                ],
              ),
            ),

            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black54),
              ),
              child: GestureDetector(
                onTap: getConsultationDate,
                child: TextField(
                  enabled: false,
                  controller: consultationDateState,
                  style: IHSTextStyle.small.copyWith(
                    color: Colors.black,
                  ),
                  decoration: const InputDecoration(
                    fillColor: IHSColors.consultationInputBackgroundColor,
                    filled: true,
                    contentPadding: EdgeInsets.all(8),
                  ),
                ),
              ),
            ),

            //施設名または担当者名
            const SizedBox(height: 8),
            const Text('施設名または担当者名'),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: IHSColors.consultationInputBackgroundColor,
                border: Border.all(color: Colors.black54),
              ),
              child: DefaultTextStyle(
                style: IHSTextStyle.small.copyWith(
                  color: Colors.black,
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
                    items: facilityPulldownValues.map((facility) {
                      return DropdownMenuItem(
                        child: Text(
                          facility,
                          style: IHSTextStyle.small.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        value: facility,
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      consultationUserSelectValueViewModel.setValue(
                        key: 'facility',
                        value: value,
                      );
                    },
                    value: getPulldownValue(
                      selectValues: selectValues,
                      state: consultationUserSelectValueState,
                      name: 'facility',
                    ),
                  ),
                ),
              ),
            ),

            //生後
            const SizedBox(height: 8),
            const Text('生後'),
            SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: TextField(
                      controller: consultationYearFromBirthState,
                      style: IHSTextStyle.small.copyWith(
                        color: Colors.black,
                      ),
                      decoration: const InputDecoration(
                        fillColor: IHSColors.consultationInputBackgroundColor,
                        filled: true,
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(8),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text('年'),
                  const SizedBox(width: 30),
                  SizedBox(
                    width: 100,
                    child: TextField(
                      controller: consultationMonthFromBirthState,
                      style: IHSTextStyle.small.copyWith(
                        color: Colors.black,
                      ),
                      decoration: const InputDecoration(
                        fillColor: IHSColors.consultationInputBackgroundColor,
                        filled: true,
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(8),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text('ヶ月'),
                ],
              ),
            ),

            //身長、体重
            const SizedBox(height: 8),
            Table(
              children: [
                TableRow(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('身長'),
                        Row(
                          children: [
                            SizedBox(
                              width: (size.width / 2) - 80,
                              child: TextField(
                                controller: consultationHeightState,
                                style: IHSTextStyle.small.copyWith(
                                  color: Colors.black,
                                ),
                                decoration: const InputDecoration(
                                  fillColor: IHSColors
                                      .consultationInputBackgroundColor,
                                  filled: true,
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.all(8),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Text('cm'),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('体重'),
                        Row(
                          children: [
                            SizedBox(
                              width: (size.width / 2) - 80,
                              child: TextField(
                                controller: consultationWeightState,
                                style: IHSTextStyle.small.copyWith(
                                  color: Colors.black,
                                ),
                                decoration: const InputDecoration(
                                  fillColor: IHSColors
                                      .consultationInputBackgroundColor,
                                  filled: true,
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.all(8),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Text('kg'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            //頭囲、胸囲
            const SizedBox(height: 8),
            Table(
              children: [
                TableRow(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('頭囲'),
                        Row(
                          children: [
                            SizedBox(
                              width: (size.width / 2) - 80,
                              child: TextField(
                                controller: consultationHeadCircumferenceState,
                                style: IHSTextStyle.small.copyWith(
                                  color: Colors.black,
                                ),
                                decoration: const InputDecoration(
                                  fillColor: IHSColors
                                      .consultationInputBackgroundColor,
                                  filled: true,
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.all(8),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Text('cm'),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('胸囲'),
                        Row(
                          children: [
                            SizedBox(
                              width: (size.width / 2) - 80,
                              child: TextField(
                                controller: consultationChestCircumferenceState,
                                style: IHSTextStyle.small.copyWith(
                                  color: Colors.black,
                                ),
                                decoration: const InputDecoration(
                                  fillColor: IHSColors
                                      .consultationInputBackgroundColor,
                                  filled: true,
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.all(8),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Text('cm'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> getConsultationDate() async {
    final consultationDateState = _ref.watch(consultationDateProvider);

    final pickedDate = getPickedDate(context: _context);

    await pickedDate.then((val) {
      consultationDateState.text = val;
    });
  }
}
