import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: SplashPage(),
      // onGenerateRoute: (RouteSettings setting) {
      //   switch (setting.name) {
      //     case 'statefulDeeperPage':
      //       return CupertinoPageRoute(
      //           builder: (_) => _StatefulDeeperPage(), settings: setting);
      //   }
      // },
    );
  }
}

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("A"), Text("B"), Lottie.asset('assets/dino.json')],
        ),
      ),
    );
  }
}
