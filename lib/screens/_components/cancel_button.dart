import 'package:family_notes/style/text_style.dart';
import 'package:flutter/material.dart';

import '../../style/colors.dart';

class CancelButton extends StatelessWidget {
  const CancelButton(
      {Key? key, required this.buttonText, required this.onPress})
      : super(key: key);
  final String buttonText;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: IHSColors.cancelButtonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      onPressed: onPress,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 40),
        child: Text(
          buttonText,
          style: IHSTextStyle.small.copyWith(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
