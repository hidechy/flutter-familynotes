// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

import 'select_panel.dart';
import 'select_panel_const_value.dart';

class SelectPanelHalfRow extends StatelessWidget {
  SelectPanelHalfRow({
    Key? key,
    required this.title,
    required this.name,
    required this.value,
  }) : super(key: key);
  final String title;
  final String name;
  final int value;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(title),
        ),
        Expanded(
          child: SelectPanel(
            valueList: SelectPanelConstValue().valueList,
            value: value,
            width: size.width / 2,
            selectName: name,
          ),
        ),
      ],
    );
  }
}
