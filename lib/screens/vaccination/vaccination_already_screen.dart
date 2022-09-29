import 'package:flutter/material.dart';

import '../../style/colors.dart';
import '../../style/text_style.dart';
import '_components/already_card.dart';

class VaccinationAlreadyScreen extends StatelessWidget {
  const VaccinationAlreadyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO 暫定値
    final dummyValue = <Map<String, dynamic>>[
      {
        'vaccine_name': 'ロタウイルスワクチン',
        'inoculation_type': 1, //１：定期　２：任意　３：他
        'vaccine_type': 1, //１：経口　２：注射
        'taking_date': ['2022/09/02', '2022/09/02', '2022/09/02', '2022/09/02'],
        'is_side_reaction': 0,
      },
      {
        'vaccine_name': '小児肺炎球菌',
        'inoculation_type': 1, //１：定期　２：任意　３：他
        'vaccine_type': 2, //１：経口　２：注射
        'taking_date': ['2022/09/02', '2022/09/02'],
        'is_side_reaction': 1,
      },
      {
        'vaccine_name': 'ロタウイルスワクチン',
        'inoculation_type': 2, //１：定期　２：任意　３：他
        'vaccine_type': 2, //１：経口　２：注射
        'taking_date': ['2022/09/02'],
        'is_side_reaction': 0,
      },
      {
        'vaccine_name': 'A型肝炎ワクチン',
        'inoculation_type': 3, //１：定期　２：任意　３：他
        'vaccine_type': 2, //１：経口　２：注射
        'taking_date': ['2022/09/02'],
        'is_side_reaction': 0,
      },
    ];
    //TODO 暫定値

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: IHSColors.vaccinationAlreadyBackgroundColor,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 8),
            Text(
              '接種記録',
              style: IHSTextStyle.medium.copyWith(
                color: IHSColors.titleColor,
              ),
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
                        AlreadyCard(vaccinationValue: dummyValue[i]),
                        if (i < (dummyValue.length - 1))
                          const Divider(color: Colors.black),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
