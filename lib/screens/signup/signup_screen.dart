// ignore_for_file: avoid_bool_literals_in_conditional_expressions, cascade_invocations

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../function.dart';
import '../../layouts/login_layouts.dart';
import '../../route/route.dart';
import '../../style/colors.dart';
import '../_components/proceed_button.dart';
import '../signIn/viewmodel/account_viewmodel.dart';
import '../signin/viewmodel/login_viewmodel.dart';

class SignupScreen extends ConsumerWidget {
  SignupScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();

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
          const Text(
            'メールアドレスで新規登録',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
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
                        key: 'password_visible1',
                        value: (loginState['password_visible1'] == 1) ? 0 : 1,
                      );
                    },
                    child: Icon(
                      (loginState['password_visible1'] == 1)
                          ? FontAwesomeIcons.solidEyeSlash
                          : FontAwesomeIcons.solidEye,
                    ),
                  ),
                ),
                obscureText:
                    (loginState['password_visible1'] == 1) ? false : true,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('パスワード（確認用）'),
              TextField(
                controller: _passwordConfirmController,
                decoration: InputDecoration(
                  fillColor: IHSColors.inputColor,
                  filled: true,
                  border: const OutlineInputBorder(),
                  contentPadding: const EdgeInsets.all(8),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      loginViewModel.setValue(
                        key: 'password_visible2',
                        value: (loginState['password_visible2'] == 1) ? 0 : 1,
                      );
                    },
                    child: Icon(
                      (loginState['password_visible2'] == 1)
                          ? FontAwesomeIcons.solidEyeSlash
                          : FontAwesomeIcons.solidEye,
                    ),
                  ),
                ),
                obscureText:
                    (loginState['password_visible2'] == 1) ? false : true,
              ),
            ],
          ),
          const SizedBox(height: 24),
          ProceedButton(
            buttonText: '新規登録',
            usage: 'signup',
            onPress: () {
              final email = _emailController.text;
              if (emailValidation(email: email)) {
                final password = _passwordController.text;
                final asswordConfirm = _passwordConfirmController.text;

                if (password != '' && asswordConfirm != '') {
                  if (password == asswordConfirm) {
                    final param = {'email': email};
                    final response =
                        getApiResponse(name: 'signup', param: param);

                    response.then((val) {
                      if (val == '') {
                        //TODO 暫定的にスナックバー、後でアラートウインドウに変更する
                        showSnackBar(context: context, msg: '認証コード発行に失敗しました。');

                        return;
                      } else {
                        accountState['email'] = email;
                        accountState['password'] = password;

                        Navigator.pushReplacementNamed(
                            context, const RoutePath.signupMailRemind().path);
                      }
                    });
                  } else {
                    //TODO 暫定的にスナックバー、後でアラートウインドウに変更する
                    showSnackBar(
                      context: context,
                      msg: 'パスワードとパスワード（確認用）の内容が異なっています。',
                    );

                    return;
                  }
                } else {
                  //TODO 暫定的にスナックバー、後でアラートウインドウに変更する
                  showSnackBar(
                    context: context,
                    msg: 'パスワードを入力してください。',
                  );

                  return;
                }
              } else {
                //TODO 暫定的にスナックバー、後でアラートウインドウに変更する
                showSnackBar(
                  context: context,
                  msg: '正しいメールアドレスを入力してください。',
                );

                return;
              }
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
                final now = DateTime.now()
                    .toString()
                    .replaceAll(' ', '')
                    .replaceAll('-', '')
                    .replaceAll(':', '')
                    .split('.')[0];

                _emailController.text = '$now@aaa.com';
                _passwordController.text = 'password';
                _passwordConfirmController.text = 'password';
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
