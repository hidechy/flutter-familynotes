import 'package:flutter/material.dart';

import '../../../style/colors.dart';
import '../../../style/text_style.dart';
import 'schedule_card.dart';

class ScheduleRecentCardArea extends StatelessWidget {
  const ScheduleRecentCardArea(
      {Key? key, required this.recentStart, required this.recentEnd})
      : super(key: key);
  final String recentStart;
  final String recentEnd;

  @override
  Widget build(BuildContext context) {
    //TODO 暫定値
    final dummyValue = <Map<String, dynamic>>[
      {
        'vaccine_name': 'ロタウイルスワクチン',
        'inoculation_type': 1, //１：定期　２：任意　３：他
        'vaccine_type': 1, //１：経口　２：注射
        'vaccination_term_start': '2022/09/02',
        'vaccination_term_end': '2022/11/02',
        'vaccination_required_num': 3,
        'vaccination_already_num': 2,
      },
      {
        'vaccine_name': '小児肺炎球菌',
        'inoculation_type': 1, //１：定期　２：任意　３：他
        'vaccine_type': 2, //１：経口　２：注射
        'vaccination_term_start': '2022/09/02',
        'vaccination_term_end': '2022/11/02',
        'vaccination_required_num': 1,
        'vaccination_already_num': 0,
      },
      {
        'vaccine_name': 'ロタウイルスワクチン',
        'inoculation_type': 2, //１：定期　２：任意　３：他
        'vaccine_type': 2, //１：経口　２：注射
        'vaccination_term_start': '2022/09/02',
        'vaccination_term_end': '2022/11/02',
        'vaccination_required_num': 2,
        'vaccination_already_num': 0,
      },
      {
        'vaccine_name': 'A型肝炎ワクチン',
        'inoculation_type': 3, //１：定期　２：任意　３：他
        'vaccine_type': 2, //１：経口　２：注射
        'vaccination_term_start': '2022/09/02',
        'vaccination_term_end': '2022/11/02',
        'vaccination_required_num': 1,
        'vaccination_already_num': 0,
      },
    ];
    //TODO 暫定値

    return Column(
      children: [
        const SizedBox(height: 8),
        Text(
          '直近3ヶ月以内の接種予定',
          style: IHSTextStyle.medium.copyWith(
            color: IHSColors.titleColor,
          ),
        ),
        Text(
          '（$recentStart 〜 $recentEnd）',
          style: IHSTextStyle.small,
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          margin: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              for (var i = 0; i < dummyValue.length; i++)
                Column(
                  children: [
                    ScheduleCard(vaccinationValue: dummyValue[i]),
                    if (i < (dummyValue.length - 1))
                      const Divider(color: Colors.black),
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }
}
