// ignore_for_file: must_be_immutable

import 'package:family_notes/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../function.dart';
import '../route/route.dart';
import '../screens/_components/drawer_menu_item.dart';
import '../screens/signIn/viewmodel/account_viewmodel.dart';
import '../style/colors.dart';

class MainLayouts extends ConsumerWidget {
  MainLayouts({
    Key? key,
    required this.body,
    required this.title,
    this.backgroundColor = IHSColors.mainContainerColor,
    this.showDrawer = true,
    this.automaticallyImplyLeading = true,
  }) : super(key: key);
  final String title;
  final Widget body;
  final Color backgroundColor;
  final bool showDrawer;
  final bool automaticallyImplyLeading;

  late BuildContext _context;
  late WidgetRef _ref;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _context = context;
    _ref = ref;

    return Scaffold(
      backgroundColor: IHSColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: IHSColors.titleColor),
        title: Text(title),
        automaticallyImplyLeading: automaticallyImplyLeading,
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(16),
          ),
          width: double.infinity,
          height: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Center(
            child: body,
          ),
        ),
      ),
      endDrawer: showDrawer ? dispDrawer(context) : null,
    );
  }

  Widget dispDrawer(BuildContext context) {
    final accountState = _ref.watch(accountProvider);

    return Theme(
      data: ThemeData(
        canvasColor: IHSColors.mainContainerColor,
      ),
      child: Drawer(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 40,
              child: DrawerHeader(
                child: Container(),
                decoration: const BoxDecoration(
                  color: IHSColors.mainContainerColor,
                ),
              ),
            ),
            DrawerMenuItem(
              buttonText: 'ホーム',
              icon: Icons.home,
              onTap: () => _popToRoot(context),
              endItem: true,
            ),
            const SizedBox(height: 24),
            DrawerMenuItem(
              buttonText: 'お子さまを登録・編集',
              icon: Icons.child_friendly_sharp,
              onTap: () =>
                  _push(context, path: const RoutePath.childInput().path),
              endItem: false,
            ),
            DrawerMenuItem(
              buttonText: '母子手帳選択',
              icon: Icons.book_outlined,
              onTap: () =>
                  _push(context, path: const RoutePath.bookSelect().path),
              endItem: true,
            ),
            const SizedBox(height: 24),
            DrawerMenuItem(
              buttonText: '体重グラフ',
              icon: Icons.add_chart,
              onTap: () =>
                  _push(context, path: const RoutePath.weightGraph().path),
              endItem: false,
            ),
            DrawerMenuItem(
              buttonText: '検診入力',
              icon: Icons.local_hospital,
              onTap: () =>
                  _push(context, path: const RoutePath.consultation().path),
              endItem: false,
            ),
            DrawerMenuItem(
              buttonText: '予防接種',
              icon: Icons.add_alert,
              onTap: () =>
                  _push(context, path: const RoutePath.vaccination().path),
              endItem: true,
            ),
            const SizedBox(height: 24),
            DrawerMenuItem(
              buttonText: '設定',
              icon: Icons.settings,
              onTap: () =>
                  _push(context, path: const RoutePath.settings().path),
              endItem: false,
            ),
            DrawerMenuItem(
              buttonText: 'お問い合わせ',
              icon: Icons.mail,
              onTap: () => _push(context, path: const RoutePath.inquiry().path),
              endItem: true,
            ),
            const SizedBox(height: 24),
            DrawerMenuItem(
              buttonText: 'ログアウト',
              icon: Icons.logout,
              onTap: () =>
                  _logout(context, userId: accountState['user_id'] as int),
              endItem: true,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _popToRoot(BuildContext context) async {
    Navigator.pop(context); // hide drawer
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  Future<void> _push(
    BuildContext context, {
    required String path,
  }) async {
    Navigator.pop(context); // hide drawer
    await Navigator.pushNamed(
      _context,
      path,
    );
  }

  void _logout(BuildContext context, {required int userId}) {
    //------------------------// api トークン削除
    final param = {'user_id': userId};

    final _ = getApiResponse(name: 'logout', param: param)
      ..then((val) {
        if (val == '') {
          ScaffoldMessenger.of(_context).showSnackBar(
            SnackBar(
              content: Text(
                'ログアウトエラー',
                style: IHSTextStyle.small,
              ),
              duration: const Duration(seconds: 5),
            ),
          );
        }
      });
    //------------------------// api トークン削除

    _popToSignIn(context);
  }

  void _popToSignIn(BuildContext context) {
    Navigator.of(context).popUntil((route) => route.isFirst);
    Navigator.pushReplacementNamed(
      _context,
      const RoutePath.signIn().path,
    );
  }
}
