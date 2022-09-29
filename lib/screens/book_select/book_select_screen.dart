import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../layouts/login_layouts.dart';

import '../../style/colors.dart';
import '../../style/text_style.dart';

import '../signIn/viewmodel/account_viewmodel.dart';

class BookSelectScreen extends ConsumerWidget {
  const BookSelectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountState = ref.watch(accountProvider);

    return LoginLayouts(
      body: Column(
        children: [
          //TODO 暫定的にログインアカウントを表示
          const SizedBox(height: 32),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration:
                BoxDecoration(color: Colors.blueAccent.withOpacity(0.2)),
            child: DefaultTextStyle(
              style: IHSTextStyle.medium.copyWith(
                color: Colors.black,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("user_id: ${accountState["user_id"] ?? ""}"),
                  Text("nickname: ${accountState["nickname"] ?? ""}"),
                  Text("email:\n${accountState["email"] ?? ""}"),
                  Text("access_token: ${accountState["access_token"] ?? ""}"),
                  const Divider(color: Colors.black, thickness: 2),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('expired_at:'),
                      Text(accountState['expired_at'] as String? ?? ''),
                      Text(
                        '※9時間ズレ。後ほど修正',
                        style: IHSTextStyle.xSmall.copyWith(
                          color: Colors.redAccent,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          //TODO 暫定的にログインアカウントを表示

          const SizedBox(height: 32),
          Text(
            '母子手帳を選んでください',
            style: IHSTextStyle.small,
          ),
          const SizedBox(height: 24),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: IHSColors.inputColor,
                border: Border.all(color: IHSColors.borderColor),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DefaultTextStyle(
                style: IHSTextStyle.small.copyWith(
                  color: Colors.black,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '妊娠5ヶ月',
                      style: IHSTextStyle.medium.copyWith(
                        color: Colors.black,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(height: 42),
                    Text(
                      '次回検診日　xxxx/xx/xx',
                      style: IHSTextStyle.small.copyWith(
                        color: Colors.black,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: IHSColors.inputColor,
                border: Border.all(color: IHSColors.borderColor),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DefaultTextStyle(
                style: IHSTextStyle.medium.copyWith(
                  color: Colors.black,
                  letterSpacing: 2,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '花子ちゃん',
                      style: IHSTextStyle.medium.copyWith(
                        color: Colors.black,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(height: 42),
                    Text(
                      '次回検診日　xxxx/xx/xx',
                      style: IHSTextStyle.small.copyWith(
                        color: Colors.black,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
