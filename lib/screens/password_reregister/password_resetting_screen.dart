import 'package:flutter/material.dart';

import '../../layouts/login_layouts.dart';
import '../../route/route.dart';
import '../../style/colors.dart';
import '../../style/text_style.dart';
import '../_components/family_notes_text_button.dart';

class PasswordResettingScreen extends StatefulWidget {
  const PasswordResettingScreen({Key? key}) : super(key: key);

  @override
  _PasswordResettingState createState() => _PasswordResettingState();
}

class _PasswordResettingState extends State<PasswordResettingScreen> {
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _pass1Controller = TextEditingController();
  final TextEditingController _pass2Controller = TextEditingController();
  bool showPassword1 = true;
  bool showPassword2 = true;
  Color passFrameColor0 = Colors.blue;
  Color passFrameColor1 = Colors.blue;
  Color passFrameColor2 = Colors.blue;
  final FocusNode _focusNode0 = FocusNode();
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return LoginLayouts(
      body: Column(
        children: [
          const SizedBox(height: 32),
          Text(
            'パスワードを再設定',
            style: IHSTextStyle.small,
          ),
          const SizedBox(height: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('送付された認証コード'),
              TextField(
                focusNode: _focusNode0,
                decoration: InputDecoration(
                  fillColor: IHSColors.inputColor,
                  filled: true,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: passFrameColor0,
                      width: 2,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 8,
                  ),
                ),
                controller: _codeController,
                keyboardType: TextInputType.emailAddress,
              ),
            ],
          ),
          const SizedBox(height: 24),
          Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('新しいパスワード'),
              ),
              TextFormField(
                focusNode: _focusNode1,
                obscureText: showPassword1,
                decoration: InputDecoration(
                  fillColor: IHSColors.inputColor,
                  filled: true,
                  //labelText: "新しいパスワード",
                  suffixIcon: IconButton(
                    icon: Icon(
                      showPassword1 ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        showPassword1 = !showPassword1;
                      });
                    },
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: passFrameColor1,
                      width: 2,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 8,
                  ),
                ),
                controller: _pass1Controller,
                keyboardType: TextInputType.visiblePassword,
              ),
            ],
          ),
          const SizedBox(height: 24),
          Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('パスワード（再確認）'),
              ),
              TextFormField(
                focusNode: _focusNode2,
                obscureText: showPassword2,
                decoration: InputDecoration(
                  fillColor: IHSColors.inputColor,
                  filled: true,
                  //labelText: "パスワード（再確認）",
                  suffixIcon: IconButton(
                    icon: Icon(
                      showPassword2 ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        showPassword2 = !showPassword2;
                      });
                    },
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: passFrameColor2,
                      width: 2,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 8,
                  ),
                ),
                controller: _pass2Controller,
                keyboardType: TextInputType.visiblePassword,
              ),
            ],
          ),
          const SizedBox(height: 16),
          DefaultTextStyle(
            style: IHSTextStyle.xSmall,
            child: Column(
              children: const [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('８桁以上\n英大文字、英小文字、数字、記号\nのうち最低２種類を使用'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          Column(
            children: [
              ElevatedButton(
                child: const Text('　 完 了 　'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fixedSize: const Size(160, 40),
                ),
                onPressed: () {
                  if (_codeController.text.isEmpty) {
                    setState(() {
                      passFrameColor0 = Colors.red;
                    });
                    _focusNode0.requestFocus();
                    return;
                  }
                  setState(() {
                    passFrameColor0 = Colors.blue;
                  });
                  if (_pass1Controller.text.isEmpty ||
                      _pass1Controller.text.length < 8) {
                    setState(() {
                      passFrameColor1 = Colors.red;
                    });
                    _focusNode1.requestFocus();
                    return;
                  }
                  setState(() {
                    passFrameColor1 = Colors.blue;
                  });
                  if (_pass1Controller.text != _pass2Controller.text) {
                    setState(() {
                      passFrameColor2 = Colors.red;
                    });
                    _focusNode2.requestFocus();
                    return;
                  }
                  setState(() {
                    passFrameColor2 = Colors.blue;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 22),
          Column(
            children: [
              ElevatedButton(
                child: const Text('キャンセル'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fixedSize: const Size(160, 40),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    const RoutePath.signIn().path,
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 22),
          FamilyNotesTextButton(
            buttonTextLine1: 'メールを再送信する',
            onPress: () {},
          ),
          const SizedBox(height: 14),
          FamilyNotesTextButton(
            buttonTextLine1: 'メールが届かない場合はこちら',
            onPress: () {
              Navigator.pushReplacementNamed(
                context,
                const RoutePath.signIn().path,
              );
            },
          ),
        ],
      ),
    );
  }
}
