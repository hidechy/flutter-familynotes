import 'package:flutter/material.dart';

import '../../style/colors.dart';
import '../../style/text_style.dart';

class ProceedButton extends StatelessWidget {
  const ProceedButton({
    Key? key,
    required this.buttonText,
    required this.onPress,
    required this.usage,
  }) : super(key: key);
  final String usage;
  final String buttonText;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: IHSColors.proceedButtonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      onPressed: onPress,
      child: Container(
        padding: getButtonPadding(),
        child: Text(
          buttonText,
          style: IHSTextStyle.small.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  EdgeInsets getButtonPadding() {
    switch (usage) {
      case 'vaccination_schedule_card':
        return const EdgeInsets.symmetric(vertical: 2, horizontal: 5);
      default:
        return const EdgeInsets.symmetric(vertical: 16, horizontal: 40);
    }
  }
}
