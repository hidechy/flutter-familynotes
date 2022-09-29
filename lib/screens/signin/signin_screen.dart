// ignore_for_file: avoid_bool_literals_in_conditional_expressions, avoid_dynamic_calls

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../function.dart';
import '../../layouts/login_layouts.dart';
import '../../route/route.dart';
import '../../style/colors.dart';
import '../../style/text_style.dart';
import '../_components/family_notes_text_button.dart';
import '../_components/proceed_button.dart';
import '../signIn/viewmodel/account_viewmodel.dart';
import 'viewmodel/login_viewmodel.dart';

class SigninScreen extends ConsumerWidget {
  SigninScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginProvider);

    final loginViewModel = ref.watch(loginProvider.notifier);

    final accountState = ref.watch(accountProvider);

    return LoginLayouts(
      body: Column(
        children: [
          const SizedBox(height: 32),
          SizedBox(
            height: 200,
            child: Image.asset('assets/images/mother_mark.png'),
          ),
          const SizedBox(height: 32),
          Text(
            'メールアドレスでログイン',
            style: IHSTextStyle.small,
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
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('パスワード'),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  fillColor: IHSColors.inputColor,
                  filled: true,
                  border: const OutlineInputBorder(),
                  contentPadding: const EdgeInsets.all(8),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      loginViewModel.setValue(
                        key: 'password_visible',
                        value: (loginState['password_visible'] == 1) ? 0 : 1,
                      );
                    },
                    child: Icon(
                      (loginState['password_visible'] == 1)
                          ? FontAwesomeIcons.solidEyeSlash
                          : FontAwesomeIcons.solidEye,
                    ),
                  ),
                ),
                obscureText:
                    (loginState['password_visible'] == 1) ? false : true,
              ),
            ],
          ),
          const SizedBox(height: 24),
          ProceedButton(
            buttonText: 'ログイン',
            usage: 'signin',
            onPress: () {
              final param = {
                'email': _emailController.text,
                'password': _passwordController.text,
              };

              final _ = getApiResponse(name: 'login', param: param)
                ..then((val) {
                  if (val == '') {
                    //TODO 暫定的にスナックバー、後でアラートウインドウに変更する
                    showSnackBar(context: context, msg: 'ログインに失敗しました。');

                    return;
                  } else {
                    final decodedValue = jsonDecode(val);

                    accountState['user_id'] = decodedValue['user_id'];
                    accountState['nickname'] = decodedValue['nickname'];
                    accountState['email'] = decodedValue['email'];
                    accountState['birthday'] = decodedValue['birthday'];
                    accountState['postal_code'] = decodedValue['postal_code'];
                    accountState['access_token'] = decodedValue['access_token'];
                    accountState['expired_at'] = decodedValue['expired_at'];

                    Navigator.pushReplacementNamed(
                      context,
                      const RoutePath.bookSelect().path,
                    );
                  }
                });
            },
          ),

          //TODO ダミー値設定

          const SizedBox(height: 24),

          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.orangeAccent.withOpacity(0.3),
            ),
            child: TextButton(
              onPressed: () {
                _emailController.text = 'loginuser@aaa.com';
                _passwordController.text = 'password';
              },
              child: Text(
                'ダミー値セット',
                style: IHSTextStyle.medium,
              ),
            ),
          ),
          //TODO ダミー値設定

          const SizedBox(height: 24),
          FamilyNotesTextButton(
            buttonTextLine1: '新規でアカウントを作成する方は、',
            buttonTextLine2: 'こちら',
            onPress: () {
              Navigator.pushReplacementNamed(
                context,
                const RoutePath.entryConsent().path,
              );
            },
          ),
          const SizedBox(height: 16),
          FamilyNotesTextButton(
            buttonTextLine1: '※ログイン用のメールアドレス、',
            buttonTextLine2: 'パスワードを忘れた方はこちら',
            onPress: () {
              Navigator.pushReplacementNamed(
                context,
                const RoutePath.passwordRegister().path,
              );
            },
          ),
        ],
      ),
    );
  }
}
