import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../function.dart';
import '../../../style/colors.dart';
import '../viewmodel/parent_report_user_select_value_viewmodel.dart';

class TeethInput extends ConsumerWidget {
  const TeethInput({
    Key? key,
    required this.parentReportKind,
    required this.selectValues,
  }) : super(key: key);
  final String parentReportKind;
  final Map<dynamic, dynamic> selectValues;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final parentReportUserSelectValueState =
        ref.watch(parentReportUserSelectValueProvider);

    final parentReportUserSelectValueViewModel =
        ref.watch(parentReportUserSelectValueProvider.notifier);

    final size = MediaQuery.of(context).size;

    final oneCelWidth = size.width / 16;

    return Stack(
      children: [
        getBackgroundContainer(),
        Column(
          children: [
            Container(alignment: Alignment.center, child: const Text('上')),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              height: 30,
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(child: Container()),
                        for (var i = 5; i > 0; i--)
                          GestureDetector(
                            onTap: () {
                              final val = getValue(
                                selectValues: selectValues,
                                state: parentReportUserSelectValueState,
                                name: 'teethTR$i',
                                minus: 0,
                              );

                              parentReportUserSelectValueViewModel.setValue(
                                key: 'teethTR$i',
                                value: (val == 1) ? 0 : 1,
                              );
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                border: Border(
                                  top: BorderSide(),
                                  bottom: BorderSide(),
                                  left: BorderSide(),
                                ),
                              ),
                              width: oneCelWidth,
                              child: (getValue(
                                        selectValues: selectValues,
                                        state: parentReportUserSelectValueState,
                                        name: 'teethTR$i',
                                        minus: 0,
                                      ) ==
                                      1)
                                  ? const Icon(Icons.close)
                                  : null,
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Row(
                      children: [
                        for (var i = 1; i <= 5; i++)
                          GestureDetector(
                            onTap: () {
                              final val = getValue(
                                selectValues: selectValues,
                                state: parentReportUserSelectValueState,
                                name: 'teethTL$i',
                                minus: 0,
                              );

                              parentReportUserSelectValueViewModel.setValue(
                                key: 'teethTL$i',
                                value: (val == 1) ? 0 : 1,
                              );
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                border: Border(
                                  top: BorderSide(),
                                  bottom: BorderSide(),
                                  right: BorderSide(),
                                ),
                              ),
                              width: oneCelWidth,
                              child: (getValue(
                                        selectValues: selectValues,
                                        state: parentReportUserSelectValueState,
                                        name: 'teethTL$i',
                                        minus: 0,
                                      ) ==
                                      1)
                                  ? const Icon(Icons.close)
                                  : null,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            getTeethExplanation(),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              height: 30,
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(child: Container()),
                        for (var i = 5; i > 0; i--)
                          GestureDetector(
                            onTap: () {
                              final val = getValue(
                                selectValues: selectValues,
                                state: parentReportUserSelectValueState,
                                name: 'teethBR$i',
                                minus: 0,
                              );

                              parentReportUserSelectValueViewModel.setValue(
                                key: 'teethBR$i',
                                value: (val == 1) ? 0 : 1,
                              );
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                border: Border(
                                  top: BorderSide(),
                                  bottom: BorderSide(),
                                  left: BorderSide(),
                                ),
                              ),
                              width: oneCelWidth,
                              child: (getValue(
                                        selectValues: selectValues,
                                        state: parentReportUserSelectValueState,
                                        name: 'teethBR$i',
                                        minus: 0,
                                      ) ==
                                      1)
                                  ? const Icon(Icons.close)
                                  : null,
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Row(
                      children: [
                        for (var i = 1; i <= 5; i++)
                          GestureDetector(
                            onTap: () {
                              final val = getValue(
                                selectValues: selectValues,
                                state: parentReportUserSelectValueState,
                                name: 'teethBL$i',
                                minus: 0,
                              );

                              parentReportUserSelectValueViewModel.setValue(
                                key: 'teethBL$i',
                                value: (val == 1) ? 0 : 1,
                              );
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                border: Border(
                                  top: BorderSide(),
                                  bottom: BorderSide(),
                                  right: BorderSide(),
                                ),
                              ),
                              width: oneCelWidth,
                              child: (getValue(
                                        selectValues: selectValues,
                                        state: parentReportUserSelectValueState,
                                        name: 'teethBL$i',
                                        minus: 0,
                                      ) ==
                                      1)
                                  ? const Icon(Icons.close)
                                  : null,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(alignment: Alignment.center, child: const Text('下')),
          ],
        ),
      ],
    );
  }

  Widget getBackgroundContainer() {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Column(
        children: [
          const SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 140,
                  decoration: const BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 140,
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget getTeethExplanation() {
    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: IHSColors.borderColor,
            width: 2,
          ),
        ),
      ),
      child: Row(
        children: [
          const Text('右'),
          Container(width: 10),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('奥'),
                      Text('前'),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('前'),
                      Text('奥'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(width: 10),
          const Text('左'),
        ],
      ),
    );
  }
}
