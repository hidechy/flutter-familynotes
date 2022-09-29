import 'package:flutter/material.dart';

import '../../route/route.dart';
import '../_components/alert_dialog.dart';
import 'agreement_screen.dart';

enum SettingItemType {
  // お子さまを登録・編集
  childInput,
  // プロフィール情報
  profile,
  // プロフィール登録
  profileRegister,
  // 個人情報保護方針
  individual,
  // プライバシーポリシー
  poricy,
  // 利用規約
  terms,
  // ログアウト
  logout,
  // 退会
  withdrawal,
}

extension SettingItemTypeEx on SettingItemType {
  String get group {
    switch (this) {
      case SettingItemType.childInput:
        return 'A';
      case SettingItemType.profile:
      case SettingItemType.profileRegister:
      case SettingItemType.individual:
      case SettingItemType.poricy:
      case SettingItemType.terms:
        return 'B';
      case SettingItemType.logout:
      case SettingItemType.withdrawal:
        return 'C';
    }
  }

  String get title {
    switch (this) {
      case SettingItemType.childInput:
        return 'お子さまを登録・編集';
      case SettingItemType.profile:
        return 'プロフィール情報';
      case SettingItemType.profileRegister:
        return 'プロフィール登録';
      case SettingItemType.individual:
        return '個人情報保護方針';
      case SettingItemType.poricy:
        return 'プライバシーポリシー';
      case SettingItemType.terms:
        return '利用規約';
      case SettingItemType.logout:
        return 'ログアウト';
      case SettingItemType.withdrawal:
        return '退会';
    }
  }

  IconData get iconData {
    switch (this) {
      case SettingItemType.childInput:
        return Icons.family_restroom;
      case SettingItemType.profile:
        return Icons.account_circle;
      case SettingItemType.profileRegister:
        return Icons.account_circle;
      case SettingItemType.individual:
        return Icons.info;
      case SettingItemType.poricy:
        return Icons.info;
      case SettingItemType.terms:
        return Icons.wc;
      case SettingItemType.logout:
        return Icons.logout;
      case SettingItemType.withdrawal:
        return Icons.outbox_outlined;
    }
  }

  void onTapAction(BuildContext context) {
    switch (this) {
      case SettingItemType.childInput:
        Navigator.pushNamed(context, const RoutePath.childInput().path);
        return;
        
      case SettingItemType.profile:
//        Navigator.pushNamed(context, const RoutePath.profile().path);
        return;

      case SettingItemType.profileRegister:
        Navigator.pushNamed(context, const RoutePath.profileRegister().path);
        return;
      case SettingItemType.individual:
        Navigator.of(context).pushNamed(
          const RoutePath.agreement().path,
          arguments: {
            'type': AgreementType.individual,
          },
        );
        return;
      case SettingItemType.poricy:
        Navigator.of(context).pushNamed(
          const RoutePath.agreement().path,
          arguments: {
            'type': AgreementType.poricy,
          },
        );
        return;
      case SettingItemType.terms:
        Navigator.of(context).pushNamed(
          const RoutePath.agreement().path,
          arguments: {
            'type': AgreementType.terms,
          },
        );
        return;
      case SettingItemType.logout:
        // ログアウト
        TwoButtonAlert(
          context: context,
          callFunc: _logoutCallback,
          message: 'ログアウトします。\nよろしいですか？',
          yesStr: 'ログアウト',
          noStr: 'キャンセル',
        ).showAlert();
        return;
      case SettingItemType.withdrawal:
        // 退会
        TwoButtonAlert(
          context: context,
          callFunc: _withdrawalCallback,
          message: '退会した場合、\n全てのデータが消去されます。\nよろしいですか？',
          yesStr: '退会する',
          noStr: 'キャンセル',
        ).showAlert();
        return;
    }
  }

  void _withdrawalCallback(BuildContext context, bool bResult) {
    debugPrint('withdrawalCallback in. bResult[$bResult]');
    if (!bResult) {
      Navigator.of(context).pop();
      return;
    }
    // ログイン画面へ
    Navigator.of(context).popUntil((route) => route.isFirst);
    Navigator.pushReplacementNamed(
      context,
      const RoutePath.signIn().path,
    );
  }

  void _logoutCallback(BuildContext context, bool bResult) {
    debugPrint('logoutCallback in. bResult[$bResult]');
    if (!bResult) {
      Navigator.of(context).pop();
      return;
    }
    // ログイン画面へ
    Navigator.of(context).popUntil((route) => route.isFirst);
    Navigator.pushReplacementNamed(
      context,
      const RoutePath.signIn().path,
    );
  }
}
