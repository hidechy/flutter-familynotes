// ignore_for_file: avoid_catches_without_on_clauses

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'endpoint.dart';
import 'style/text_style.dart';

Future<String> getPickedDate({required BuildContext context}) async {
  final consultationDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(DateTime.now().year - 3),
    lastDate: DateTime(DateTime.now().year + 3),
  );

  if (consultationDate != null) {
    return consultationDate.toString().split(' ')[0];
  } else {
    return '';
  }
}

//////////////////////////////////////////////////

int getValue({
  required Map<dynamic, dynamic> selectValues,
  required Map<dynamic, dynamic> state,
  required String name,
  required int minus,
}) {
  //二択の切り替えは0, 1
  //三択の切り替えは1, 2, 3..のため、使用時にマイナスする数(1)を渡す

  return (state[name] != null)
      ? (state[name]! as int) - minus
      : (selectValues[name] != null)
          ? (selectValues[name] as int)
          : 0;
}

String getPulldownValue({
  required Map<dynamic, dynamic> selectValues,
  required Map<dynamic, dynamic> state,
  required String name,
}) {
  return (state[name] != null)
      ? (state[name]! as String)
      : (selectValues[name] != null)
          ? (selectValues[name] as String)
          : '';
}

//////////////////////////////////////////////////

Future<String> getApiResponse({
  required String name,
  required Map<String, dynamic> param,
}) async {
  try {
    final headers = <String, String>{'content-type': 'application/json'};

    final url = getEndPoint(name: name);

    Response response;

    if (param.isNotEmpty) {
      final body = json.encode(param);

      response = await post(Uri.parse(url), headers: headers, body: body);
    } else {
      response = await post(Uri.parse(url), headers: headers);
    }

    if (response.body.isEmpty) {
      throw Exception();
    }

    return response.body;
  } on Exception {
    return '';
  }
}

bool emailValidation({required String email}) {
  final emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);

  return emailValid;
}

//TODO 暫定的にスナックバー、後でアラートウインドウに変更する
void showSnackBar({required BuildContext context, required String msg}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        msg,
        style: IHSTextStyle.small.copyWith(
          color: Colors.white,
        ),
      ),
      duration: const Duration(seconds: 5),
    ),
  );
}

Future<String> getAddressFromPostCode(
    {required Map<String, dynamic> param}) async {
  try {
    final headers = <String, String>{'content-type': 'application/json'};
    final url =
        "https://zipcloud.ibsnet.co.jp/api/search?zipcode=${param['postcode']}";

    final body = json.encode(param);

    final response = await post(Uri.parse(url), headers: headers, body: body);

    return response.body;
  } catch (e) {
    return '';
  }
}
