//import "dart:js";

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../screens/book_select/book_select_screen.dart';
import '../screens/child/child_input_screen.dart';
import '../screens/consultation/consultation_input_screen.dart';
import '../screens/consultation/consultation_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/inquiry/inquiry_screen.dart';
import '../screens/mail_remind/mail_remind_screen.dart';
import '../screens/parent_report/parent_report_input_screen.dart';
import '../screens/password_reregister/password_reregister_screen.dart';
import '../screens/password_reregister/password_resetting_screen.dart';
import '../screens/profile/profile_complete_screen.dart';
import '../screens/profile/profile_register_screen.dart';
import '../screens/settings/agreement_screen.dart';
import '../screens/settings/settings_screen.dart';
import '../screens/signin/signin_screen.dart';
import '../screens/signup/code_confirm_screen.dart';
import '../screens/signup/consent_screen.dart';
import '../screens/signup/signup_screen.dart';
import '../screens/vaccination/vaccination_screen.dart';
import '../screens/weight_graph/weight_graph_screen.dart';
import 'exception.dart';

part 'route.freezed.dart';

@freezed
class RoutePath with _$RoutePath {
  factory RoutePath.fromPath(String path) {
    if (path == const RoutePath.root().path) {
      return const RoutePath.root();
    } else if (path == const RoutePath.signIn().path) {
      return const RoutePath.signIn();
    } else if (path == const RoutePath.signUp().path) {
      return const RoutePath.signUp();
    } else if (path == const RoutePath.passwordRegister().path) {
      return const RoutePath.passwordRegister();
    } else if (path == const RoutePath.passwordResetting().path) {
      return const RoutePath.passwordResetting();
    } else if (path == const RoutePath.childInput().path) {
      return const RoutePath.childInput();
    } else if (path == const RoutePath.bookSelect().path) {
      return const RoutePath.bookSelect();
    } else if (path == const RoutePath.weightGraph().path) {
      return const RoutePath.weightGraph();
    } else if (path == const RoutePath.vaccination().path) {
      return const RoutePath.vaccination();
    } else if (path == const RoutePath.settings().path) {
      return const RoutePath.settings();
    } else if (path == const RoutePath.inquiry().path) {
      return const RoutePath.inquiry();
    } else if (path == const RoutePath.profileRegister().path) {
      return const RoutePath.profileRegister();
    } else if (path == const RoutePath.agreement().path) {
      return const RoutePath.agreement();
    } else if (path == const RoutePath.consultation().path) {
      return const RoutePath.consultation();
    } else if (path == const RoutePath.parentReportInput().path) {
      return const RoutePath.parentReportInput();
    } else if (path == const RoutePath.consultationInput().path) {
      return const RoutePath.consultationInput();
    } else if (path == const RoutePath.signupMailRemind().path) {
      return const RoutePath.signupMailRemind();
    } else if (path == const RoutePath.codeConfirm().path) {
      return const RoutePath.codeConfirm();
    } else if (path == const RoutePath.profileComplete().path) {
      return const RoutePath.profileComplete();
    } else if (path == const RoutePath.entryConsent().path) {
      return const RoutePath.entryConsent();
    }

    throw const RouteException.pathNotFound();
  }

  /// ルート
  const factory RoutePath.root() = RootRoutePath;

  /// サインイン
  const factory RoutePath.signIn() = SigninRoutePath;

  /// サインアップ
  const factory RoutePath.signUp() = SignUpRoutePath;

  /// パスワード登録
  const factory RoutePath.passwordRegister() = PasswordRegisterRoutePath;

  /// パスワードリセット
  const factory RoutePath.passwordResetting() = PasswordResetRoutePath;

  /// お子さま登録
  const factory RoutePath.childInput() = ChildInputRoutePath;

  /// 母子手帳選択
  const factory RoutePath.bookSelect() = BookSelectRoutePath;

  /// 体重グラフ
  const factory RoutePath.weightGraph() = WeightRoutePath;

  /// 予防接種
  const factory RoutePath.vaccination() = VaccinationRoutePath;

  /// 設定
  const factory RoutePath.settings() = SettingsRoutePath;

  /// お問い合わせ
  const factory RoutePath.inquiry() = InquiryRoutePath;

  /// プロフィール登録
  const factory RoutePath.profileRegister() = ProfileRegisterRoutePath;

  /// 同意（個人情報保護方針orプライバシーポリシーor利用規約）
  const factory RoutePath.agreement() = AgreementRoutePath;

  /// 検診入力選択
  const factory RoutePath.consultation() = ConsultationRoutePath;

  /// 保護者の記録
  const factory RoutePath.parentReportInput() = ParentReportInputRoutePath;

  // 検診入力
  const factory RoutePath.consultationInput() = ConsultationInputRoutePath;

  // メールリマインド（サインアップ）
  const factory RoutePath.signupMailRemind() = SignupMailRemindRoutePath;

  // 認証コード確認
  const factory RoutePath.codeConfirm() = CodeConfirmRoutePath;

  // プロフィール登録完了
  const factory RoutePath.profileComplete() = ProfileCompleteRoutePath;

  // 同意画面（新規登録）
  const factory RoutePath.entryConsent() = entryConsentRoutePath;

  const RoutePath._();

  String get path => when(
        root: () => '/',
        signIn: () => '/signIn',
        signUp: () => '/signUp',
        passwordRegister: () => '/passwordRegister',
        passwordResetting: () => '/passwordResetting',
        childInput: () => '/childInput',
        bookSelect: () => '/bookSelect',
        weightGraph: () => '/weightGraph',
        vaccination: () => '/vaccination',
        settings: () => '/settings',
        inquiry: () => '/inquiry',
        profileRegister: () => '/profileRegister',
        agreement: () => '/agreement',
        consultation: () => '/consultation',
        parentReportInput: () => '/parentReportInput',
        consultationInput: () => '/consultationInput',
        signupMailRemind: () => '/signupMailRemind',
        codeConfirm: () => '/codeConfirm',
        profileComplete: () => '/profileComplete',
        entryConsent: () => '/entryConsent',
      );
}

Route<dynamic> generateRoute(RouteSettings settings) {
  if (settings.name == null) {
    throw const RouteException.pathNotFound();
  }

  final args = settings.arguments as Map<String, dynamic>?;

  final routerPath = RoutePath.fromPath(settings.name!);

  return routerPath.when(
    root: () => PageRouteBuilder<void>(
      settings: RouteSettings(name: routerPath.path),
      pageBuilder: (_, __, ___) => const HomeScreen(),
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
    ),
    signIn: () => PageRouteBuilder<void>(
      settings: RouteSettings(name: routerPath.path),
      pageBuilder: (_, __, ___) => SigninScreen(),
      transitionDuration: Duration.zero,
    ),
    signUp: () => PageRouteBuilder<void>(
      settings: RouteSettings(name: routerPath.path),
      pageBuilder: (_, __, ___) => SignupScreen(),
    ),
    passwordRegister: () => PageRouteBuilder<void>(
      settings: RouteSettings(name: routerPath.path),
      pageBuilder: (_, __, ___) => PasswordReregisterScreen(),
    ),
    passwordResetting: () => PageRouteBuilder<void>(
      settings: RouteSettings(name: routerPath.path),
      pageBuilder: (_, __, ___) => const PasswordResettingScreen(),
    ),
    childInput: () => MaterialPageRoute<void>(
      settings: RouteSettings(name: routerPath.path),
      builder: (_) => ChildInputScreen(),
    ),
    bookSelect: () => MaterialPageRoute<void>(
      settings: RouteSettings(name: routerPath.path),
      builder: (_) => const BookSelectScreen(),
    ),
    weightGraph: () => MaterialPageRoute<void>(
      settings: RouteSettings(name: routerPath.path),
      builder: (_) => const WeightGraphScreen(),
    ),
    vaccination: () => MaterialPageRoute<void>(
      settings: RouteSettings(name: routerPath.path),
      builder: (_) => const VaccinationScreen(),
    ),
    settings: () => MaterialPageRoute<void>(
      settings: RouteSettings(name: routerPath.path),
      builder: (_) => const SettingsScreen(),
    ),
    inquiry: () => MaterialPageRoute<void>(
      settings: RouteSettings(name: routerPath.path),
      builder: (_) => const InquiryScreen(),
    ),
    profileRegister: () => MaterialPageRoute<void>(
      settings: RouteSettings(name: routerPath.path),
      builder: (_) => ProfileRegisterScreen(),
    ),
    agreement: () {
      final type = args!['type'] as AgreementType;
      return MaterialPageRoute<void>(
        settings: RouteSettings(name: routerPath.path),
        builder: (_) => AgreementScreen(type: type),
      );
    },
    consultation: () => MaterialPageRoute<void>(
      settings: RouteSettings(name: routerPath.path),
      builder: (_) => ConsultationScreen(),
    ),
    parentReportInput: () {
      final parentReportKind = args!['parentReportKind'] as String;
      return MaterialPageRoute<void>(
        settings: RouteSettings(name: routerPath.path),
        builder: (_) => ParentReportInputScreen(
          parentReportKind: parentReportKind,
        ),
      );
    },
    consultationInput: () {
      final consultationKind = args!['consultationKind'] as String;
      return MaterialPageRoute<void>(
        settings: RouteSettings(name: routerPath.path),
        builder: (_) => ConsultationInputScreen(
          consultationKind: consultationKind,
        ),
      );
    },
    signupMailRemind: () => MaterialPageRoute(
      settings: RouteSettings(name: routerPath.path),
      builder: (_) => const MailRemindScreen(usage: 'signup'),
    ),
    codeConfirm: () => MaterialPageRoute(
      settings: RouteSettings(name: routerPath.path),
      builder: (_) => CodeConfirmScreen(),
    ),
    profileComplete: () => MaterialPageRoute(
      settings: RouteSettings(name: routerPath.path),
      builder: (_) => const ProfileCompleteScreen(),
    ),
    entryConsent: () => MaterialPageRoute(
      settings: RouteSettings(name: routerPath.path),
      builder: (_) => const ConsentScreen(),
    ),
  );
}
