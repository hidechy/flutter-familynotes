import 'package:flutter/material.dart';

import '../../../style/colors.dart';
import '../../../style/text_style.dart';

class ConsulParentSelectButton extends StatelessWidget {
  const ConsulParentSelectButton({
    Key? key,
    required this.title,
    required this.name,
    required this.state,
    required this.viewmodelMethod,
  }) : super(key: key);
  final String title;
  final String name;
  final String state;
  final Function(String) viewmodelMethod;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: (name == state)
            ? IHSColors.selectPanelBackgroundColor1
            : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        side: const BorderSide(color: IHSColors.proceedButtonColor),
      ),
      onPressed: () {
        viewmodelMethod(name);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Text(
          title,
          style: IHSTextStyle.small,
        ),
      ),
    );
  }
}
