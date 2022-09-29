import 'package:flutter/material.dart';

import '../../../style/colors.dart';
import '../../../style/text_style.dart';

class ScheduleAfterRecentTitle extends StatelessWidget {
  const ScheduleAfterRecentTitle({Key? key, required this.futureTitleMonth})
      : super(key: key);
  final int futureTitleMonth;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$futureTitleMonth月以降の接種予定',
      style: IHSTextStyle.medium.copyWith(
        color: IHSColors.titleColor,
      ),
    );
  }
}
