import 'package:flutter/material.dart';

import 'schedule_card.dart';

class ScheduleAfterRecentCardArea extends StatelessWidget {
  const ScheduleAfterRecentCardArea(
      {Key? key, required this.afterRecentYear, required this.afterRecentMonth})
      : super(key: key);
  final int afterRecentYear;
  final int afterRecentMonth;

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

    //TODO ExpansionTileの内容
    final list = <Widget>[];
    for (var i = 0; i < dummyValue.length; i++) {
      list.add(
        Column(
          children: [
            ScheduleCard(vaccinationValue: dummyValue[i]),
            if (i < (dummyValue.length - 1))
              const Divider(
                color: Colors.black,
              ),
          ],
        ),
      );
    }
    //TODO ExpansionTileの内容

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: const BoxDecoration(color: Colors.white),
      child: ExpansionTile(
        title: Text(
          '$afterRecentYear年$afterRecentMonth月の接種予定',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        children: list,
      ),
    );
  }
}
