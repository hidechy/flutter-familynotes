// ignore_for_file: must_be_immutable, inference_failure_on_collection_literal, unnecessary_lambdas

import 'package:family_notes/screens/_components/proceed_button.dart';
import 'package:family_notes/screens/child/viewmodel/child_user_select_value_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../function.dart';
import '../../layouts/main_layouts.dart';
import '../../style/colors.dart';
import '../../style/text_style.dart';
import '../_components/select_panel.dart';
import '../_components/select_panel_const_value.dart';
import '../signIn/viewmodel/account_viewmodel.dart';
import 'viewmodel/child_user_text_value_viewmodel.dart';

class ChildInputScreen extends ConsumerWidget {
  ChildInputScreen({Key? key}) : super(key: key);

  late BuildContext _context;
  late WidgetRef _ref;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _context = context;
    _ref = ref;

    final accountState = ref.watch(accountProvider);

    // final childLastnameState = ref.watch(childLastnameProvider);
    // final childFirstnameState = ref.watch(childFirstnameProvider);
    // final childLastnameKanaState = ref.watch(childLastnameKanaProvider);
    // final childFirstnameKanaState = ref.watch(childFirstnameKanaProvider);

    final childNicknameState = ref.watch(childNicknameProvider);

    final childBirthdayState = ref.watch(childBirthdayProvider);

    final childUserSelectValueState = ref.watch(childUserSelectValueProvider);

    //TODO ダミー値登録用
    final childUserSelectValueViewModel =
        ref.watch(childUserSelectValueProvider.notifier);
    //TODO ダミー値登録用

    final selectValues = {};

    final size = MediaQuery.of(context).size;

    const horizontalPadding = 24.0;

    return MainLayouts(
      title: 'お子さま情報',
      showDrawer: false,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*

            // 姓

            const SizedBox(height: 24),

            const Text('姓'),

            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black54),
              ),
              child: TextField(
                controller: childLastnameState,
                style: IHSTextStyle.small,
                decoration: const InputDecoration(
                  fillColor: IHSColors.consultationInputBackgroundColor,
                  filled: true,
                  contentPadding: EdgeInsets.all(8),
                ),
              ),
            ),

            // 名

            const SizedBox(height: 8),

            const Text('名'),

            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black54),
              ),
              child: TextField(
                controller: childFirstnameState,
                style: IHSTextStyle.small,
                decoration: const InputDecoration(
                  fillColor: IHSColors.consultationInputBackgroundColor,
                  filled: true,
                  contentPadding: EdgeInsets.all(8),
                ),
              ),
            ),

            // ふりがな（姓）

            const SizedBox(height: 8),

            const Text('ふりがな（姓）'),

            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black54),
              ),
              child: TextField(
                controller: childLastnameKanaState,
                style: IHSTextStyle.small,
                decoration: const InputDecoration(
                  fillColor: IHSColors.consultationInputBackgroundColor,
                  filled: true,
                  contentPadding: EdgeInsets.all(8),
                ),
              ),
            ),

            // ふりがな（名）

            const SizedBox(height: 8),

            const Text('ふりがな（名）'),

            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black54),
              ),
              child: TextField(
                controller: childFirstnameKanaState,
                style: IHSTextStyle.small,
                decoration: const InputDecoration(
                  fillColor: IHSColors.consultationInputBackgroundColor,
                  filled: true,
                  contentPadding: EdgeInsets.all(8),
                ),
              ),
            ),

            */

            // お子さまのお名前

            const SizedBox(height: 24),

            const Text('お子さまのお名前（ニックネーム）'),

            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black54),
              ),
              child: TextField(
                controller: childNicknameState,
                style: IHSTextStyle.small,
                decoration: const InputDecoration(
                  fillColor: IHSColors.consultationInputBackgroundColor,
                  filled: true,
                  contentPadding: EdgeInsets.all(8),
                ),
              ),
            ),

            // 性別

            const SizedBox(height: 8),

            const Text('性別'),

            SelectPanel(
              valueList: SelectPanelConstValue().childGendarValueList,
              value: getValue(
                selectValues: selectValues,
                state: childUserSelectValueState,
                name: 'child_gender',
                minus: 1,
              ),
              width: size.width - (horizontalPadding * 2),
              selectName: 'child_gender',
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
                onTap: () => getChildBirthday(),
                child: TextField(
                  enabled: false,
                  controller: childBirthdayState,
                  style: IHSTextStyle.small,
                  decoration: const InputDecoration(
                    fillColor: IHSColors.consultationInputBackgroundColor,
                    filled: true,
                    contentPadding: EdgeInsets.all(8),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            Container(
              alignment: Alignment.center,
              child: ProceedButton(
                buttonText: '登録',
                onPress: () {
                  /*
//    print(accountState);

flutter: {
email: 20220928142751@aaa.com,
password: password,
user_id: 12,
access_token: z69c9TJKTg,
expired_at: 2022-09-29T05:27:57.450031Z,
nickname: dummy20220928142751,
birthday: 2000-01-01,
postalCode: 1000001}

    */

                  print(accountState['user_id']);
                  print(childNicknameState.text);
                  print(childBirthdayState.text);
                  print(childUserSelectValueState['child_gender']);
                },
                usage: 'childInput',
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
                  // childLastnameState.text = '駄身井';
                  // childFirstnameState.text = '太郎';
                  // childLastnameKanaState.text = 'だみい';
                  // childFirstnameKanaState.text = 'たろう';

                  childNicknameState.text = 'たろう';

                  childBirthdayState.text = '2020-02-02';

                  childUserSelectValueViewModel.setValue(
                    key: 'child_gender',
                    value: 1,
                  );
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
      ),
    );
  }

  Future<void> getChildBirthday() async {
    final childBirthdayState = _ref.watch(childBirthdayProvider);

    final pickedDate = getPickedDate(context: _context);

    await pickedDate.then((val) {
      childBirthdayState.text = val;
    });
  }
}
