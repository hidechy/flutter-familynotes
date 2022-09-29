// ignore_for_file: must_be_immutable, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../style/colors.dart';
import '../../../style/text_style.dart';
import '../viewmodel/consultation_user_text_value_viewmodel.dart';

class MemoInput extends ConsumerWidget {
  MemoInput({Key? key, required this.selectValues}) : super(key: key);
  final Map<dynamic, dynamic> selectValues;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final consultationMemoState = ref.watch(consultationMemoProvider);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: DefaultTextStyle(
        style: IHSTextStyle.small,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('メモ'),
            SizedBox(
              width: double.infinity,
              child: TextField(
                controller: consultationMemoState,
                maxLines: 5,
                style: IHSTextStyle.small,
                decoration: const InputDecoration(
                  fillColor: IHSColors.consultationInputBackgroundColor,
                  filled: true,
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
