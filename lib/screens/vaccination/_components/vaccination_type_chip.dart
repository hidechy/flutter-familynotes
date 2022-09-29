import 'package:flutter/material.dart';

import '../../../style/colors.dart';
import '../../../style/text_style.dart';

class VaccineTypeChip extends StatelessWidget {
  const VaccineTypeChip({Key? key, required this.value, required this.usage})
      : super(key: key);
  final int value;
  final String usage;

  @override
  Widget build(BuildContext context) {
    final text = getText();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      width: (usage == 'vaccine_type') ? null : 40,
      decoration: BoxDecoration(
        border: Border.all(color: IHSColors.proceedButtonColor, width: 2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        style: IHSTextStyle.xSmall.copyWith(
          color: IHSColors.proceedButtonColor,
        ),
      ),
    );
  }

  String getText() {
    var text = '';

    switch (usage) {
      case 'vaccine_type':
        switch (value) {
          case 1:
            text = '経口';
            break;
          case 2:
            text = '注射';
            break;
        }

        break;
      default:
        text = value.toString();
        break;
    }

    return text;
  }
}
