import 'package:flutter/material.dart';

import '../../style/colors.dart';

const dialogCornerAngle = 16.0;
const buttonCornerAngle = 16.0;
const buttonUnderSpace = 8.0;

// １ボタン
class OneButtonAlert {
  OneButtonAlert({
    required this.context,
    required this.callFunc,
    required this.message,
    required this.yesStr,
    this.yesColor = IHSColors.proceedButtonColor,
  });
  final BuildContext context;
  final Function(BuildContext, bool)? callFunc;
//final ValueChanged callFunc;
  final String message;
  final String yesStr;
  Color? yesColor;

  void showAlert() {
    showDialog(
      barrierDismissible: false, // 周囲黒部分のタップ無効
      context: context,
      builder: (_) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(dialogCornerAngle),
          ),
          title: Text(
            message,
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  child: ElevatedButton(
                    child: Text(yesStr),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: yesColor,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(buttonCornerAngle),
                      ),
                    ),
                    onPressed: () {
                      if (callFunc != null) {
                        callFunc!(context, true);
                      } else {
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                ),
              ],
            ),
            const Padding(
              // ボタン下の余白を調整
              padding: EdgeInsets.only(bottom: buttonUnderSpace),
            ),
          ],
        );
      },
    );
  }
}

// ２ボタン
class TwoButtonAlert {
  //final ValueChanged callFunc;

  TwoButtonAlert({
    required this.context,
    required this.callFunc,
    required this.message,
    required this.yesStr,
    required this.noStr,
    this.yesColor = IHSColors.proceedButtonColor,
    this.noColor = IHSColors.cancelButtonColor,
  });
  final BuildContext context;
  final Function(BuildContext, bool)? callFunc;
  final String message;
  final String yesStr;
  final String noStr;
  Color yesColor;
  Color noColor;

  void showAlert() {
    showDialog<void>(
      barrierDismissible: false, // 周囲黒部分のタップ無効
      context: context,
      builder: (_) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(dialogCornerAngle),
          ),
          title: Text(
            message,
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  child: ElevatedButton(
                    child: Text(yesStr),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: yesColor,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(buttonCornerAngle),
                      ),
                    ),
                    onPressed: () {
                      if (callFunc != null) {
                        callFunc!(context, true);
                      } else {
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                ),
                GestureDetector(
                  child: ElevatedButton(
                    child: Text(noStr),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: noColor,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(buttonCornerAngle),
                      ),
                    ),
                    onPressed: () {
                      if (callFunc != null) {
                        callFunc!(context, false);
                      } else {
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                )
              ],
            ),
            const Padding(
              // ボタン下の余白を調整
              padding: EdgeInsets.only(bottom: buttonUnderSpace),
            ),
          ],
        );
      },
    );
  }
}
