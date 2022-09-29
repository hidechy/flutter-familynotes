import 'package:flutter/material.dart';

import '../../style/colors.dart';
import '../../style/text_style.dart';

enum AgreementType {
  individual,
  poricy,
  terms,
}

extension on AgreementType {
  String get title {
    switch (this) {
      case AgreementType.individual:
        return '個人情報保護方針';
      case AgreementType.poricy:
        return 'プライバシーポリシー';
      case AgreementType.terms:
        return '利用規約';
    }
  }
}

/// 同意を必要とする画面（個人情報・プライバシーポリシー・利用規約）
class AgreementScreen extends StatelessWidget {
  const AgreementScreen({
    Key? key,
    required this.type,
  }) : super(key: key);

  final AgreementType type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: IHSColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: IHSColors.titleColor),
        title: Text(type.title),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Column(
            children: [
              Expanded(
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  // TODO: 本文（個人情報保護方針orプラポリor規約）を表示する
                  child: Center(
                    child: Container(),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: 128,
                height: 48,
                child: TextButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    backgroundColor: IHSColors.pink400,
                  ),
                  onPressed: () {
                    // TODO: 同意時の処理
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    '同意する',
                    style: IHSTextStyle.small.copyWith(
                      color: Colors.white,
                      height: 1.2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: 128,
                height: 48,
                child: TextButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    backgroundColor: IHSColors.black400,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'キャンセル',
                    style: IHSTextStyle.small.copyWith(
                      color: Colors.white,
                      height: 1.2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
