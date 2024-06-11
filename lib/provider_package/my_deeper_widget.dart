import 'package:day_1/provider_package/meals_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class MyDeeperWidget extends StatelessWidget {
  const MyDeeperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // final value = context.watch<int?>();
    // return Text("MyDeeperWidget.static provider: $value");

    return Consumer<MealsProvider>(builder: (context, meals, child) {
      return Text("dynamic provider: ${meals.items}");
    });

    // final value = Provider.of<MealsProvider>(context, listen: false).items;
    // return Text("MyDeeperWidget.dynamic provider: $value");
  }
}
