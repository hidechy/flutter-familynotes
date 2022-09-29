import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../layouts/login_layouts.dart';
import '../../route/route.dart';
import '../_components/proceed_button.dart';
import '../consultation/viewmodel/consultation_select_value_viewmodel.dart';

class ProfileCompleteScreen extends ConsumerWidget {
  const ProfileCompleteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //consultationから借りる
    final consultationSelectValueViewModel =
        ref.watch(consultationSelectValueProvider.notifier);

    return LoginLayouts(
      body: Column(
        children: [
          const SizedBox(height: 32),
          const Text(
            'プロフィールの登録が完了しました。',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          const Text('プロフィール情報を変更したときは、'),
          const Text('設定画面より行ってください。'),
          const SizedBox(height: 24),
          const Text('次にお子さま登録を行います。'),
          const SizedBox(height: 24),
          ProceedButton(
            buttonText: 'お子さま登録',
            onPress: () {
              consultationSelectValueViewModel.setValue(value: 'childInput');

              Navigator.pushReplacementNamed(
                  context, const RoutePath.childInput().path);
            },
            usage: 'profileComplete',
          ),
        ],
      ),
    );
  }
}
