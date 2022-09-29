// ignore_for_file: cascade_invocations, avoid_dynamic_calls

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../function.dart';
import '../../layouts/login_layouts.dart';
import '../../style/colors.dart';
import '../_components/cancel_button.dart';
import '../_components/proceed_button.dart';
import '../signIn/viewmodel/account_viewmodel.dart';

class CodeConfirmScreen extends ConsumerWidget {
  CodeConfirmScreen({Key? key}) : super(key: key);

  final TextEditingController _authCodeController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountState = ref.watch(accountProvider);

    return LoginLayouts(
      body: Column(
        children: [
          const SizedBox(height: 32),
          const Text(
            '認証コードを確認します',
            style: TextStyle(
              fontSize: 18,
              color: IHSColors.titleColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          const Text('ご登録されたメールアドレスに'),
          const Text('お送りした認証コードを'),
          const Text('入力してください'),
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('送付された認証コード'),
              TextField(
                decoration: const InputDecoration(
                  fillColor: IHSColors.inputColor,
                  filled: true,
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(8),
                ),
                controller: _authCodeController,
                keyboardType: TextInputType.emailAddress,
              ),
            ],
          ),
          const SizedBox(height: 24),
          ProceedButton(
            buttonText: '送信',
            onPress: () {
              final authCode = _authCodeController.text;

              if (authCode != '') {
                final param = {
                  'email': accountState['email'],
                  'password': accountState['password'],
                  'auth_code': authCode,
                };

                final response =
                    getApiResponse(name: 'codeConfirm', param: param);

                response.then((val) {
                  if (val == '') {
                    //TODO 暫定的にスナックバー、後でアラートウインドウに変更する
                    showSnackBar(context: context, msg: '認証コード確認に失敗しました。');

                    return;
                  } else {
                    final decodedValue = jsonDecode(val);

                    accountState['user_id'] = decodedValue['user_id'];

                    accountState['access_token'] = decodedValue['access_token'];
                    accountState['expired_at'] = decodedValue['expired_at'];

                    Navigator.pushReplacementNamed(context, '/profileRegister');
                  }
                });
              } else {
                //TODO 暫定的にスナックバー、後でアラートウインドウに変更する
                showSnackBar(
                  context: context,
                  msg: '認証コードを入力してください。',
                );

                return;
              }
            },
            usage: 'signupCodeConfirm',
          ),
          const SizedBox(height: 24),
          CancelButton(
            buttonText: 'キャンセル',
            onPress: () {},
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
                _authCodeController.text = '999999';
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
