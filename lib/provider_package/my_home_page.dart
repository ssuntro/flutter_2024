import 'package:day_1/provider_package/meals_provider.dart';
import 'package:day_1/provider_package/my_stf_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final value = Provider.of<MealsProvider>(context, listen: false).items;

    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text("MyHomePage"),
            // Text("MyHomePage.dynamic provider: $value"),
            MySTFWidget()
          ],
        ),
      ),
    );
  }
}
