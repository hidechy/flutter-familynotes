import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'route/route.dart';
import 'style/colors.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Family Notes',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            color: IHSColors.titleColor,
            fontSize: 20,
          ),
        ),
      ),
      onGenerateRoute: generateRoute,
      initialRoute: const RoutePath.signIn().path,
      debugShowCheckedModeBanner: false,
    );
  }
}
