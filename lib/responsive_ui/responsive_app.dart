import 'dart:io';

import 'package:day_1/responsive_ui/new_expense_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
//*fix orientation

  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  //     .then((fn) {
  //   runApp(const MyApp());
  // });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    print("width: $width");
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
            child: width < 600
                ? const Column(
                    children: [
                      Expanded(child: MyWidget()),
                      Expanded(child: MyWidget())
                    ],
                  )
                : const Row(
                    children: [
                      Expanded(child: MyWidget()),
                      Expanded(child: MyWidget())
                    ],
                  )),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
          .withOpacity(1.0),
      child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                if (Platform.isAndroid) {
                  showDialog(
                      context: context,
                      builder: (ctx) => const AlertDialog(
                            title: Text("Error"),
                            content: Text("body"),
                          ));
                }
                if (Platform.isIOS) {
                  showCupertinoDialog(
                      context: context,
                      builder: (ctx) => CupertinoAlertDialog(
                            title: const Text("Error"),
                            content: const Text("body"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(ctx);
                                  },
                                  child: const Text("close"))
                            ],
                          ));
                }
              },
              child: Text("open dialog")),
          ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                    useSafeArea: true,
                    isScrollControlled: true,
                    context: context,
                    builder: (ctx) => NewExpensePage());
              },
              child: Text("show new expense modal"))
        ],
      ),
    );
  }
}

class MyWidgetdddd extends StatefulWidget {
  const MyWidgetdddd({super.key});

  @override
  State<MyWidgetdddd> createState() => _MyWidgetddddState();
}

class _MyWidgetddddState extends State<MyWidgetdddd> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
