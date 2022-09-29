// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../style/colors.dart';

class LoginLayouts extends StatelessWidget {
  const LoginLayouts({Key? key, required this.body}) : super(key: key);
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: IHSColors.backGroundColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: IHSColors.loginContainerColor,
            borderRadius: BorderRadius.circular(16),
          ),
          width: double.infinity,
          height: double.infinity,
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Center(
            child: body,
          ),
        ),
      ),
    );
  }
}
