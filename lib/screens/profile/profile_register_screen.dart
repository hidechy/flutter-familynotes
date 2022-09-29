// ignore_for_file: must_be_immutable, unnecessary_lambdas, cascade_invocations, avoid_dynamic_calls

import 'dart:convert';

import 'package:family_notes/function.dart';
import 'package:family_notes/screens/_components/proceed_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../layouts/login_layouts.dart';
import '../../route/route.dart';
import '../../style/colors.dart';

import '../../style/text_style.dart';
import '../signIn/viewmodel/account_viewmodel.dart';
import 'viewmodel/profile_user_text_value_viewmodel.dart';

class ProfileRegisterScreen extends ConsumerWidget {
  ProfileRegisterScreen({Key? key}) : super(key: key);

  late BuildContext _context;
  late WidgetRef _ref;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _context = context;
    _ref = ref;

    final accountState = ref.watch(accountProvider);

    //----------------------//
    final profileNicknameState = ref.watch(profileNicknameProvider);
    final profileBirthdayState = ref.watch(profileBirthdayProvider);
    final profilePostalCodeState = ref.watch(profilePostalCodeProvider);
    final profileAddressState = ref.watch(profileAddressProvider);
    //----------------------//

    return LoginLayouts(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 32),
          const Text(
            'プロフィール登録',
            style: TextStyle(
              fontSize: 18,
              color: IHSColors.titleColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),

          // メールアドレス

          const Text('メールアドレス'),
          Text(accountState['email'].toString()),

          // 名前（ニックネーム）

          const SizedBox(height: 24),

          const Text('名前（ニックネーム）'),

          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black54),
            ),
            child: TextField(
              enabled: false,
              controller: profileNicknameState,
              style: IHSTextStyle.small.copyWith(
                color: Colors.black,
              ),
              decoration: const InputDecoration(
                fillColor: IHSColors.inputColor,
                filled: true,
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(8),
              ),
            ),
          ),

          // 生年月日

          const SizedBox(height: 8),

          const Text('生年月日'),

          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black54),
            ),
            child: GestureDetector(
              onTap: () => getProfileBirthday(),
              child: TextField(
                enabled: false,
                controller: profileBirthdayState,
                style: IHSTextStyle.small.copyWith(
                  color: Colors.black,
                ),
                decoration: const InputDecoration(
                  fillColor: IHSColors.inputColor,
                  filled: true,
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(8),
                ),
              ),
            ),
          ),

          // 郵便番号

          const SizedBox(height: 8),

          const Text('郵便番号'),

          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: profilePostalCodeState,
                  style: IHSTextStyle.small.copyWith(
                    color: Colors.black,
                  ),
                  decoration: const InputDecoration(
                    fillColor: IHSColors.inputColor,
                    filled: true,
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(8),
                  ),
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                child: ProceedButton(
                    buttonText: '確認',
                    onPress: () {
                      final param = {
                        'postcode': profilePostalCodeState.text,
                      };

                      final response = getAddressFromPostCode(param: param);

                      response.then((val) {
                        if (val == '') {
                          //TODO 暫定的にスナックバー、後でアラートウインドウに変更する
                          showSnackBar(context: context, msg: '住所取得に失敗しました。');

                          return;
                        } else {
                          final decodedValue = jsonDecode(val);

                          if (decodedValue['status'] != 200) {
                            //TODO 暫定的にスナックバー、後でアラートウインドウに変更する
                            showSnackBar(context: context, msg: '住所取得に失敗しました。');

                            return;
                          } else {
                            profileAddressState.text =
                                '${decodedValue['results'][0]['address1']}${decodedValue['results'][0]['address2']}${decodedValue['results'][0]['address3']}';
                          }
                        }
                      });
                    },
                    usage: 'profilePostalCode'),
              ),
            ],
          ),

          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black54),
              ),
            ),
            child: TextField(
              enabled: false,
              controller: profileAddressState,
              style: IHSTextStyle.small.copyWith(
                color: Colors.black,
              ),
              decoration: const InputDecoration(
                fillColor: IHSColors.consultationInputBackgroundColor,
                filled: true,
                contentPadding: EdgeInsets.all(8),
              ),
            ),
          ),

          const SizedBox(height: 24),

          Container(
            alignment: Alignment.center,
            child: ProceedButton(
              buttonText: 'プロフィール登録',
              onPress: () {
                if (profileNicknameState.text != '') {
                  if (profileBirthdayState.text != '') {
                    if (profileAddressState.text != '') {
                      accountState['nickname'] = profileNicknameState.text;
                      accountState['birthday'] = profileBirthdayState.text;
                      accountState['postalCode'] = profilePostalCodeState.text;

                      Navigator.pushReplacementNamed(
                          context, const RoutePath.profileComplete().path);
                    } else {
                      //TODO 暫定的にスナックバー、後でアラートウインドウに変更する
                      showSnackBar(
                        context: context,
                        msg: '郵便番号を入力してください。',
                      );
                    }
                  } else {
                    //TODO 暫定的にスナックバー、後でアラートウインドウに変更する
                    showSnackBar(
                      context: context,
                      msg: '生年月日を入力してください。',
                    );
                  }
                } else {
                  //TODO 暫定的にスナックバー、後でアラートウインドウに変更する
                  showSnackBar(
                    context: context,
                    msg: 'ニックネームを入力してください。',
                  );

                  return;
                }
              },
              usage: 'profileRegister',
            ),
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
                profileNicknameState.text =
                    'dummy${accountState['email'].toString().split('@')[0]}';
                profileBirthdayState.text = '2000-01-01';
                profilePostalCodeState.text = '1000001';
                profileAddressState.text = '';
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

  Future<void> getProfileBirthday() async {
    final profileBirthdayState = _ref.watch(profileBirthdayProvider);

    final pickedDate = getPickedDate(context: _context);

    await pickedDate.then((val) {
      profileBirthdayState.text = val;
    });
  }
}
