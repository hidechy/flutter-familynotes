import 'package:flutter/material.dart';

import '../../../style/colors.dart';
import '../../../style/text_style.dart';

class InoculationChip extends StatelessWidget {
  const InoculationChip({Key? key, required this.inoculationType})
      : super(key: key);
  final int inoculationType;

  @override
  Widget build(BuildContext context) {
    var text = '';
    var textColor = Colors.black;
    var chipColor = Colors.white;

    switch (inoculationType) {
      case 1:
        text = '定期';
        textColor = Colors.black;
        chipColor = IHSColors.vaccinationInoculationTypeChipBackgroundColor1;
        break;
      case 2:
        text = '任意';
        textColor = Colors.white;
        chipColor = IHSColors.vaccinationInoculationTypeChipBackgroundColor2;
        break;
      case 3:
        text = '他';
        textColor = Colors.white;
        chipColor = IHSColors.vaccinationInoculationTypeChipBackgroundColor3;
        break;
    }

    return CircleAvatar(
      child: Text(
        text,
        style: IHSTextStyle.small.copyWith(
          color: textColor,
        ),
      ),
      backgroundColor: chipColor,
    );
  }
}
