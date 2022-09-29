import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../layouts/login_layouts.dart';
import '../../style/colors.dart';
import '../_components/cancel_button.dart';
import '../_components/family_notes_text_button.dart';
import '../_components/proceed_button.dart';
import '../signin/viewmodel/login_viewmodel.dart';
import '_components/consent_checkbox.dart';

class ConsentScreen extends ConsumerWidget {
  const ConsentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginProvider);

    //TODO ダミー値設定用
    final loginViewModel = ref.watch(loginProvider.notifier);
    //TODO ダミー値設定用

    return LoginLayouts(
      body: Column(
        children: [
          const SizedBox(height: 32),
          const Text(
            'ご確認ください',
            style: TextStyle(
              fontSize: 18,
              color: IHSColors.titleColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: const [
                ConsentCheckbox(
                  title: 'プライバシーポリシーに同意する',
                  name: 'is_privacy_policy_consent',
                ),
                ConsentCheckbox(
                  title: '個人情報保護方針に同意する',
                  name: 'is_privacy_protection_consent',
                ),
                ConsentCheckbox(
                  title: '利用規約に同意する',
                  name: 'is_service_terms_consent',
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          (loginState['is_privacy_policy_consent'] == 1 &&
                  loginState['is_privacy_protection_consent'] == 1 &&
                  loginState['is_service_terms_consent'] == 1)
              ? ProceedButton(
                  buttonText: '次へ',
                  onPress: () =>
                      Navigator.pushReplacementNamed(context, '/signUp'),
                  usage: 'consent_screen',
                )
              : CancelButton(
                  buttonText: '次へ',
                  onPress: () {},
                ),
          const SizedBox(height: 24),
          FamilyNotesTextButton(
            buttonTextLine1: '※すでにアカウントをお持ちの方は、',
            buttonTextLine2: 'こちら',
            onPress: () {
              Navigator.pushReplacementNamed(context, '/signIn');
            },
          ),

          //TODO ダミー値設定↓

          const SizedBox(height: 24),

          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.orangeAccent.withOpacity(0.3),
            ),
            child: TextButton(
              onPressed: () {
                loginViewModel
                  ..setValue(key: 'is_privacy_policy_consent', value: 1)
                  ..setValue(key: 'is_privacy_protection_consent', value: 1)
                  ..setValue(key: 'is_service_terms_consent', value: 1);
              },
              child: const Text(
                'ダミー値セット',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          //TODO ダミー値設定↑
        ],
      ),
    );
  }
}
