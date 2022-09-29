import 'package:flutter/material.dart';

import '../../../style/colors.dart';
import '../../../style/text_style.dart';
import '../../_components/proceed_button.dart';
import 'inoculation_chip.dart';
import 'vaccination_type_chip.dart';

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({Key? key, required this.vaccinationValue})
      : super(key: key);
  final Map<String, dynamic> vaccinationValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: DefaultTextStyle(
        style: IHSTextStyle.small,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InoculationChip(
                  inoculationType: vaccinationValue['inoculation_type'] as int,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VaccineTypeChip(
                        value: vaccinationValue['vaccine_type'] as int,
                        usage: 'vaccine_type',
                      ),
                      Text(vaccinationValue['vaccine_name'] as String),
                    ],
                  ),
                ),
                ProceedButton(
                  buttonText: '接種',
                  usage: 'vaccination_schedule_card',
                  onPress: () {},
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text('接種推奨期間：'),
            Text(
              "${vaccinationValue["vaccination_term_start"]} 〜 ${vaccinationValue["vaccination_term_end"]}",
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(child: Container()),
                SizedBox(
                  width: double.parse(
                    ((vaccinationValue['vaccination_required_num'] as int) * 40)
                        .toString(),
                  ),
                  height: 40,
                  child: ListView.builder(
                    itemCount:
                        vaccinationValue['vaccination_required_num'] as int,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        getVaccinationRequiredNumChip(index: index),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getVaccinationRequiredNumChip({required int index}) {
    return Container(
      child: (index < (vaccinationValue['vaccination_already_num'] as int))
          ? CircleAvatar(
              child: Text(
                (index + 1).toString(),
                style: IHSTextStyle.small.copyWith(
                  color: IHSColors.proceedButtonColor,
                ),
              ),
              backgroundColor: Colors.white,
            )
          : const CircleAvatar(backgroundColor: IHSColors.borderColor),
      width: 30,
      padding: const EdgeInsets.all(2),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: (index < (vaccinationValue['vaccination_already_num'] as num))
          ? const BoxDecoration(
              color: IHSColors.proceedButtonColor,
              shape: BoxShape.circle,
            )
          : null,
    );
  }
}
