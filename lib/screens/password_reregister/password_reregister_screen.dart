import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../../layouts/login_layouts.dart';
import '../../route/route.dart';
import '../../style/colors.dart';
import '../../style/text_style.dart';
import '../_components/alert_dialog.dart';
import '../_components/cancel_button.dart';
import '../_components/proceed_button.dart';

// ignore: must_be_immutable
class PasswordReregisterScreen extends StatelessWidget {
  PasswordReregisterScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  bool waitButtonFlag = false;

  @override
  Widget build(BuildContext context) {
    return LoginLayouts(
      body: Column(
        children: [
          const SizedBox(height: 32),
          Text(
            'メールアドレスを確認します',
            style: IHSTextStyle.small,
          ),
          const SizedBox(height: 24),
          DefaultTextStyle(
            style: IHSTextStyle.small,
            child: Column(
              children: const [
                Text('アカウントを作成したメールアドレスを'),
                Text('入力して、送信ボタンを押してください。'),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('メールアドレス'),
              TextField(
                decoration: const InputDecoration(
                  fillColor: IHSColors.inputColor,
                  filled: true,
                  border: OutlineInputBorder(),
                  hintText: 'example@test.jp',
                  contentPadding: EdgeInsets.all(8),
                ),
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
            ],
          ),
          const SizedBox(height: 24),
          ProceedButton(
            buttonText: '送信',
            usage: 'password_reregister',
            onPress: () => emailValidation(context),
          ),
          const SizedBox(height: 24),
          CancelButton(
            buttonText: 'ログインページへ',
            onPress: () => Navigator.pushReplacementNamed(
              context,
              const RoutePath.signIn().path,
            ),
          ),
        ],
      ),
    );
  }

  // emailバリデーションチェック
  Future<void> emailValidation(BuildContext context) async {
    if (waitButtonFlag) {
      return;
    }
    waitButtonFlag = true;
    if (!EmailValidator.validate(_emailController.text)) {
      OneButtonAlert(
        context: context,
        callFunc: (context, result) => signInCallback(context, bResult: result),
        message: '入力されたメールアドレスで\n登録されたアカウントは\nありませんでした。\nアカウントの新規登録を\n行ってください。',
        yesStr: 'アプリトップへ',
      ).showAlert();
      return;
    }
    //　API call ?
    // ok なら
    OneButtonAlert(
      context: context,
      callFunc: (context, result) => nextCallback(context, bResult: result),
      message: 'パスワード設定用の\nメールを送信しました。',
      yesStr: '次へ',
    ).showAlert();
  }

  //
  void nextCallback(BuildContext context, {required bool bResult}) {
    Navigator.pushReplacementNamed(
      context,
      const RoutePath.passwordResetting().path,
    );
  }

  void signInCallback(BuildContext context, {required bool bResult}) {
    waitButtonFlag = false;
    Navigator.pushReplacementNamed(
      context,
      const RoutePath.signIn().path,
    );
  }
}
