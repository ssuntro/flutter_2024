import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key}) {
    print("MyHomePage constructor is called");
  }

  @override
  State<MyHomePage> createState() => _MyHomePageState();

  @override
  StatefulElement createElement() {
    print("MyHomePage createElement is called");
    return super.createElement();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    print("MyHomePage build is called");
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text("Home")),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ToggleWidget(),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'statefulDeeperPage');
                },
                child: Text("Go to stateful page")),
            SizedBox(height: 200, child: Container()),
            AStaticText()
          ],
        ),
      ),
    );
  }
}

class ToggleWidget extends StatefulWidget {
  const ToggleWidget({super.key});

  @override
  State<ToggleWidget> createState() => _ToggleWidgetState();
}

class _ToggleWidgetState extends State<ToggleWidget> {
  var _isShowText = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        (_isShowText ? Text("I am a toggled text") : Container()),
        ElevatedButton(
            onPressed: () {
              setState(() {
                _isShowText = !_isShowText;
              });
            },
            child: Text("To show/hide text")),
      ],
    );
  }
}

class AStaticText extends StatelessWidget {
  final bgColor =
      Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  AStaticText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(color: bgColor, child: Text("I am a static text"));
  }
}

class _StatefulDeeperPage extends StatefulWidget {
  _StatefulDeeperPage({super.key}) {
    print("_StatefulDeeperPage contructor is called");
  }

  @override
  State<_StatefulDeeperPage> createState() {
    print("_StatefulDeeperPage createState is called");
    return __StatefulDeeperPageState();
  }

  @override
  StatefulElement createElement() {
    print("_StatefulDeeperPage createElement is called");
    return super.createElement();
  }
}

class __StatefulDeeperPageState extends State<_StatefulDeeperPage> {
  @override
  void initState() {
    print("__StatefulDeeperPageState initState is called");
    super.initState();
  }

  @override
  void didUpdateWidget(covariant _StatefulDeeperPage oldWidget) {
    print("__StatefulDeeperPageState didUpdateWidget is called");
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    print("__StatefulDeeperPageState dispose is called");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("__StatefulDeeperPageState build is called");
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("AAA"),
        ),
        child: Center(
          child: Icon(CupertinoIcons.share),
        ));
  }
}
