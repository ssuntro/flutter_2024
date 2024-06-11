import 'package:day_1/provider_package/meals_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyPaymentPage extends StatelessWidget {
  const MyPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final value = Provider.of<MealsProvider>(context, listen: false).items;
    return Scaffold(appBar: AppBar(), body: Text('dynamic provider: $value}'));
  }
}
