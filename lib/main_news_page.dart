import 'package:day_1/const_stf_widget.dart';
import 'package:day_1/models/news.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainNewsPage extends StatefulWidget {
  const MainNewsPage({super.key});

  @override
  State<MainNewsPage> createState() => _MainNewsPageState();
}

class _MainNewsPageState extends State<MainNewsPage> {
  final model = <News>[
    News(
        title: "title1",
        status: NewsStatus.closed,
        thumbnail: 'assets/images/animal.jpeg'),
    News(
        title: "title2",
        status: NewsStatus.pendingResponse,
        thumbnail: 'assets/images/default.png'),
    News(
        title: "title3",
        status: NewsStatus.responsed,
        thumbnail: 'assets/images/finance.jpeg'),
    News(
        title: "title4",
        status: NewsStatus.responsed,
        thumbnail: "assets/images/global_warming.jpeg"),
    News(
        title: "title5",
        status: NewsStatus.responsed,
        thumbnail: 'assets/images/animal.jpeg'),
    News(
        title: "title6",
        status: NewsStatus.responsed,
        thumbnail: "assets/images/global_warming.jpeg"),
    News(
        title: "title7",
        status: NewsStatus.responsed,
        thumbnail: 'assets/images/animal.jpeg'),
    News(
        title: "title8",
        status: NewsStatus.responsed,
        thumbnail: "assets/images/global_warming.jpeg"),
    News(
        title: "title9",
        status: NewsStatus.responsed,
        thumbnail: 'assets/images/animal.jpeg')
  ];
  @override
  Widget build(BuildContext context) {
    // var a = new List<int>.generate(10, (index) => index + 1)
    // .map((elem) => Text("$elem"));

    final aa = model.map((elem) => buildListItem(elem));
    return CupertinoPageScaffold(
        navigationBar: buildNavBar(),
        child: ReorderableListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return buildListItem(model[index]);
            },
            itemCount: aa.length,
            onReorder: onReorder
            // children: aa.toList()
            ));
  }

  void onReorder(int oldIndex, int newIndex) {
    return;
  }

  Container buildListItem(News item) {
    return Container(
      key: Key(item.title),
      height: 100,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(0),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.zero))),
          onPressed: () {},
          child: Row(
            children: [
              Image.asset(item.thumbnail),
              Container(width: 15),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      item.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    IgnorePointer(
                        child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: item.status.foregroundColor,
                          backgroundColor: item.status.backgroundColor),
                      onPressed: () {},
                      child: Text(item.status.rawValue),
                    ))
                  ],
                ),
              )
            ],
          )),
    );
  }

  CupertinoNavigationBar buildNavBar() {
    return CupertinoNavigationBar(
        middle: Text("Home"),
        backgroundColor: Colors.amber,
        leading: IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: Icon(Icons.add)),
        trailing: Text("AA"));
  }
}
