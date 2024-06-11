import 'package:day_1/main_news_page.dart';
import 'package:day_1/news_list_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 3000), () {
      print("Future.delayed");
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => MainNewsPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/dino.json', onLoaded: (composition) {
              setState(() {});
            })
          ],
        ),
      ),
    );
  }
}
