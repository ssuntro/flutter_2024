import 'package:day_1/provider_package/meals_provider.dart';
import 'package:day_1/provider_package/my_home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());

  // runApp(
  //   MultiProvider(
  //     providers: [
  //       ChangeNotifierProvider(create: (context) => MealsProvider()),
  //        ChangeNotifierProvider(create: (context) => FilterProvider())
  //       // Provider(create: (context) => SomeOtherClass()),
  //     ],
  //     child: const MyApp(),
  //   ),
  // );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: MealsProvider(),
        child: MaterialApp(
          home: MyHomePage(),
        ));

    // MaterialApp(
    //   home: MyHomePage(),
    // );
  }
}
