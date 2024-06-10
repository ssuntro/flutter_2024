import 'package:day_1/models/news.dart';
import 'package:day_1/models/news_category.dart';
import 'package:day_1/models/news_status.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyPage());
  }
}

class MyPage extends StatefulWidget {
  MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

List<News> get fetchNews {
  return <News>[
    News(
      title: "title1",
      status: NewsStatus.closed,
      category: NewsCategory.animal,
    ),
    News(
      title: "title2",
      status: NewsStatus.pendingResponse,
      category: NewsCategory.unknown,
    ),
    News(
      title: "title3",
      status: NewsStatus.responsed,
      category: NewsCategory.finance,
    ),
    News(
      title: "title4",
      status: NewsStatus.responsed,
      category: NewsCategory.finance,
    ),
    News(
      title: "title5",
      status: NewsStatus.responsed,
      category: NewsCategory.finance,
    ),
  ];
}

class _MyPageState extends State<MyPage> {
  var model = fetchNews;
  StatefulWidget a = Column(
    children: [Text("")],
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                model = fetchNews;
              });
            },
            icon: const Icon(Icons.add),
          )
        ],
        leading: IconButton(
          onPressed: () {
            setState(() {
              model.removeAt(0);
            });
          },
          icon: const Icon(Icons.remove),
        ),
        title: Text("MyPage"),
      ),
      body: SafeArea(
          child: Column(
        children: [
          for (final item in model)
            MyWidget(
              key: ValueKey(item.title),
              title: item.title,
            )
        ],
      )),
    );
  }
}

class MyWidget extends StatefulWidget {
  final String title;
  const MyWidget({required super.key, required this.title});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  Color? bgColor;

  @override
  void initState() {
    bgColor =
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // key: widget.key,
      child: Text(widget.title),
      color: bgColor,
      height: 100,
    );
  }
}
