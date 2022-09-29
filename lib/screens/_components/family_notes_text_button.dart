import 'package:flutter/material.dart';

import '../../style/colors.dart';
import '../../style/text_style.dart';

class FamilyNotesTextButton extends StatelessWidget {
  const FamilyNotesTextButton(
      {Key? key,
      required this.buttonTextLine1,
      this.buttonTextLine2 = '',
      required this.onPress})
      : super(key: key);
  final String buttonTextLine1;
  final String buttonTextLine2;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      child: DefaultTextStyle(
        style: IHSTextStyle.small.copyWith(
          decoration: TextDecoration.underline,
          color: IHSColors.titleColor,
        ),
        child: Column(
          children: [
            Text(buttonTextLine1),
            if (buttonTextLine2 != '') Text(buttonTextLine2),
          ],
        ),
      ),
    );
  }
}
