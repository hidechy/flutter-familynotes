import 'package:flutter/material.dart';

import '../../layouts/main_layouts.dart';

class InquiryScreen extends StatelessWidget {
  const InquiryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayouts(
      title: 'お問い合わせ',
      body: const Text('InquiryScreen'),
    );
  }
}
