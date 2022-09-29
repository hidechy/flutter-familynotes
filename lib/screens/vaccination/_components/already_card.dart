// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../style/text_style.dart';
import 'inoculation_chip.dart';
import 'side_reaction_chip.dart';
import 'vaccination_type_chip.dart';

class AlreadyCard extends StatelessWidget {
  AlreadyCard({Key? key, required this.vaccinationValue}) : super(key: key);
  final Map<String, dynamic> vaccinationValue;

  String selectedValue = '';
  List<String> popupMenuValues = ['', '編集', '削除'];

  @override
  Widget build(BuildContext context) {
    final list = <Widget>[];
    final headNumber = ['①', '②', '③', '④', '⑤', '⑥', '⑦', '⑧', '⑨', '⑩'];
    final dateList = vaccinationValue['taking_date'] as List<String>;
    for (var i = 0; i < dateList.length; i++) {
      list.add(
        Text(
          '${headNumber[i]} ${dateList[i]}',
          style: IHSTextStyle.medium,
        ),
      );
    }

    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 180),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        child: DefaultTextStyle(
          style: IHSTextStyle.small,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    Text(
                      vaccinationValue['vaccine_name'] as String,
                      style: IHSTextStyle.small,
                    ),
                    const SizedBox(height: 8),
                    Column(
                      children: list,
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  PopupMenuButton<String>(
                    initialValue: selectedValue,
                    onSelected: (String s) {},
                    itemBuilder: (BuildContext context) {
                      return popupMenuValues.map((String s) {
                        return PopupMenuItem(
                          child: Text(s),
                          value: s,
                        );
                      }).toList();
                    },
                  ),
                  const SizedBox(height: 24),
                  if (vaccinationValue['is_side_reaction'] == 1)
                    const SideReactionChip(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
