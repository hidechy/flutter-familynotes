import 'package:flutter/material.dart';

import '../../layouts/main_layouts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayouts(
      title: '母子手帳アプリ',
      automaticallyImplyLeading: false,
      body: const Text('HomeScreen'),
    );
  }
}
