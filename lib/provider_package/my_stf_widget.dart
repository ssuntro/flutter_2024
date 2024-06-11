import 'package:day_1/provider_package/meals_provider.dart';
import 'package:day_1/provider_package/my_deeper_widget.dart';
import 'package:day_1/provider_package/my_payment_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MySTFWidget extends StatefulWidget {
  const MySTFWidget({super.key});

  @override
  State<MySTFWidget> createState() => _MySTFWidgetState();
}

class _MySTFWidgetState extends State<MySTFWidget> {
  @override
  Widget build(BuildContext context) {
    // final value = context.watch<int?>();
    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              Provider.of<MealsProvider>(context, listen: false)
                  .appendMeal(Meal(name: "_MySTFWidgetState", id: "11"));
            },
            child: const Text("set MealsProvider")),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) {
                    return const MyPaymentPage();
                  },
                  fullscreenDialog: true));
            },
            child: const Text("go to MyPayment page")),
        // Text("_MySTFWidgetState.static provider: $value"),
        MyDeeperWidget(),
        MyDeeperWidget()
      ],
    );
  }
}
