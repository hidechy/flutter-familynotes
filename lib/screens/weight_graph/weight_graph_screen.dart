import 'package:flutter/material.dart';

import '../../layouts/main_layouts.dart';

class WeightGraphScreen extends StatelessWidget {
  const WeightGraphScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayouts(
      title: '体重グラフ',
      body: const Text('WeightGraphScreen'),
    );
  }
}
