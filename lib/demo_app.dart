import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DemoListApp());
}

class DemoListApp extends StatelessWidget {
  const DemoListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(home: DemoListPage());
  }
}

class DemoListPage extends StatelessWidget {
  const DemoListPage({super.key});
  static const List<String> entries = <String>['A', 'B', 'C', 'D', 'E'];
  @override
  Widget build(BuildContext context) {
    final a = entries.map<Widget>((String input) {
      return Container(
        width: 80,
        color: Colors.blueAccent,
        child: Text(input),
      );
    });
    return CupertinoPageScaffold(
      child: SafeArea(
          child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [...a]),
      )
          // buildListView(),
          ),
    );
  }

  ListView buildListView() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.all(0),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          width: 80,
          color: index % 2 == 0 ? Colors.blueAccent : Colors.yellowAccent,
          child: Text(entries[index]),
        );
      },
      // children: [...a],
    );
  }
}
