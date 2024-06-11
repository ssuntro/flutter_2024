import 'package:day_1/news_list_provider.dart';
import 'package:day_1/splash_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: NewsListProvider(),
        child: MaterialApp(
          home: SplashPage(),
        ));

    // onGenerateRoute: (RouteSettings setting) {
    //   switch (setting.name) {
    //     case 'statefulDeeperPage':
    //       return CupertinoPageRoute(
    //           builder: (_) => _StatefulDeeperPage(), settings: setting);
    //   }
    // },
  }
}
