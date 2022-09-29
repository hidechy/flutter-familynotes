import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../layouts/login_layouts.dart';
import '../../route/route.dart';
import '../../style/colors.dart';
import '../_components/proceed_button.dart';
import '../signIn/viewmodel/account_viewmodel.dart';

class MailRemindScreen extends ConsumerWidget {
  const MailRemindScreen({Key? key, required this.usage}) : super(key: key);
  final String usage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountState = ref.watch(accountProvider);

    return LoginLayouts(
      body: Column(
        children: [
          const SizedBox(height: 32),
          const Text(
            '認証コードをご確認ください',
            style: TextStyle(
              fontSize: 18,
              color: IHSColors.titleColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          const Text('ご登録されたメールアドレスに'),
          const Text('認証コードを送信しました'),
          const SizedBox(height: 32),
          Text(
            accountState['email'].toString(),
            style: const TextStyle(
              fontSize: 18,
              color: IHSColors.titleColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          ProceedButton(
            buttonText: '次へ',
            onPress: () => Navigator.pushReplacementNamed(
                context, const RoutePath.codeConfirm().path),
            usage: 'consent_screen',
          ),
          const SizedBox(height: 32),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: const Text(
              '※迷惑メールフォルダやゴミ箱に自動的に振り分けられている可能性がありますので、一度ご確認いただきます様お願いいたします。',
            ),
          ),
        ],
      ),
    );
  }
}
