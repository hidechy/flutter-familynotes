// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../function.dart';
import '../../../style/colors.dart';
import '../../../style/text_style.dart';
import '../viewmodel/parent_report_user_text_value_viewmodel.dart';
import 'teeth_input.dart';

class DentalInput extends ConsumerWidget {
  DentalInput({
    Key? key,
    required this.parentReportKind,
    required this.selectValues,
  }) : super(key: key);
  final String parentReportKind;
  final Map<dynamic, dynamic> selectValues;

  late BuildContext _context;
  late WidgetRef _ref;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _context = context;
    _ref = ref;

    final parentReportTeethingDateState =
        ref.watch(parentReportTeethingDateProvider);

    return DecoratedBox(
      decoration: const BoxDecoration(color: Colors.white),
      child: ExpansionTile(
        title: Text(
          '歯科入力',
          style: IHSTextStyle.small,
        ),
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('歯が生え始めたのはいつですか。'),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54),
                  ),
                  child: GestureDetector(
                    onTap: getTeethingDate,
                    child: TextField(
                      enabled: false,
                      controller: parentReportTeethingDateState,
                      style: IHSTextStyle.small,
                      decoration: const InputDecoration(
                        fillColor: IHSColors.consultationInputBackgroundColor,
                        filled: true,
                        contentPadding: EdgeInsets.all(8),
                      ),
                    ),
                  ),
                ),
                getBorder(),
                const Text('むし歯など歯の異常に気づいたら、歯をタップして✖印をつけておきましょう。'),
                const SizedBox(height: 8),
                TeethInput(
                  parentReportKind: parentReportKind,
                  selectValues: selectValues,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getBorder() {
    return Column(
      children: const [
        SizedBox(height: 8),
        Divider(color: IHSColors.borderColor, thickness: 2),
        SizedBox(height: 8),
      ],
    );
  }

  Future<void> getTeethingDate() async {
    final parentReportTeethingDateState =
        _ref.watch(parentReportTeethingDateProvider);

    final pickedDate = getPickedDate(context: _context);

    await pickedDate.then((val) {
      parentReportTeethingDateState.text = val;
    });
  }
}
