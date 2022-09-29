// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../function.dart';
import '../../../style/colors.dart';
import '../../../style/text_style.dart';
import '../viewmodel/parent_report_user_text_value_viewmodel.dart';

class BaseInput extends ConsumerWidget {
  BaseInput(
      {Key? key, required this.parentReportKind, required this.selectValues})
      : super(key: key);
  final String parentReportKind;
  final Map<dynamic, dynamic> selectValues;

  Map<String, String> parentReportTypeNames = {
    'OneMonths': '1か月児健康診査',
    'ThreeMonths': '3〜4か月児健康診査',
    'TixMonths': '6〜7か月児健康診査',
    'NineMonths': '9〜10か月児健康診査',
    'OneYears': '1歳児健康診査',
    'OnehalfYears': '1歳6か月児健康診査',
    'TwoYears': '2歳児健康診査',
    'ThreeYears': '3歳児健康診査'
  };

  late BuildContext _context;
  late WidgetRef _ref;

  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _context = context;
    _ref = ref;

    final parentReportDateState = ref.watch(parentReportDateProvider);

    nameController.text = '${parentReportTypeNames[parentReportKind]}';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: DefaultTextStyle(
        style: IHSTextStyle.small,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //検診名
            const Text('検診名'),

            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black54),
              ),
              child: TextField(
                enabled: false,
                controller: nameController,
                style: IHSTextStyle.small,
                decoration: const InputDecoration(
                  fillColor: IHSColors.consultationInputBackgroundColor,
                  filled: true,
                  contentPadding: EdgeInsets.all(8),
                ),
              ),
            ),

            //記録日
            const SizedBox(height: 8),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '記録日',
                    style: IHSTextStyle.small,
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
                onTap: getParentReportDate,
                child: TextField(
                  enabled: false,
                  controller: parentReportDateState,
                  style: IHSTextStyle.small,
                  decoration: const InputDecoration(
                    fillColor: IHSColors.consultationInputBackgroundColor,
                    filled: true,
                    contentPadding: EdgeInsets.all(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> getParentReportDate() async {
    final parentReportDateState = _ref.watch(parentReportDateProvider);

    final pickedDate = getPickedDate(context: _context);

    await pickedDate.then((val) {
      parentReportDateState.text = val;
    });
  }
}
