import 'package:flutter/material.dart';

import '../../../style/colors.dart';
import '../../../style/text_style.dart';

class SideReactionChip extends StatelessWidget {
  const SideReactionChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircleAvatar(
        minRadius: 30,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            '副反応',
            style: IHSTextStyle.small.copyWith(
              color: IHSColors.requireCautionColor,
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      padding: const EdgeInsets.all(2),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: const BoxDecoration(
        color: IHSColors.requireCautionColor,
        shape: BoxShape.circle,
      ),
    );
  }
}
