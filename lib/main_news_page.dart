import 'package:day_1/add_news_page.dart';
import 'package:day_1/const_stf_widget.dart';
import 'package:day_1/models/news.dart';
import 'package:day_1/models/news_category.dart';
import 'package:day_1/models/news_status.dart';
import 'package:day_1/news_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainNewsPage extends StatefulWidget {
  const MainNewsPage({super.key});

  @override
  State<MainNewsPage> createState() => MainNewsPageState();
}

List<News> get fetchNewsList {
  return <News>[
    News(
      title: "title1",
      status: NewsStatus.closed,
      category: NewsCategory.animal,
      body: '',
      url: '',
    ),
    News(
      title: "title2",
      status: NewsStatus.pendingResponse,
      category: NewsCategory.unknown,
      body: '',
      url: '',
    ),
  ];
}

class MainNewsPageState extends State<MainNewsPage>
    with WidgetsBindingObserver {
  var model = fetchNewsList;

  var _isReorderEnabled = false;
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    NewsList.fetchAPI().then((value) => print("NewsList.fetchAPI: $value"));
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    // var a = new List<int>.generate(10, (index) => index + 1)
    // .map((elem) => Text("$elem"));

    final aa = model.map((elem) => buildListItem(elem));
    return CupertinoPageScaffold(
        navigationBar: buildNavBar(),
        child: SafeArea(
          child: ReorderableListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return buildListItem(model[index]);
              },
              itemCount: aa.length,
              onReorder: onReorder
              // children: aa.toList()
              ),
        ));
  }

  void onReorder(int oldIndex, int newIndex) {
    if (!_isReorderEnabled) {
      return;
    }
    if (oldIndex < newIndex) {
      // removing the item at oldIndex will shorten the list by 1.
      newIndex -= 1;
    }

    final News element = model.removeAt(oldIndex);
    model.insert(newIndex, element);
  }

  void onNewsAdded(News news) {
    setState(() {
      model.add(news);
    });
  }
}

extension RenderExtension on MainNewsPageState {
  Container buildNewsListTile(News item) {
    final title = item.title;
    final status = item.status.rawValue;
    final imagePath = item.category.imagePath;
    return Container(
      key: Key(item.title),
      height: 100,
      child: ListTile(
        leading: Image.asset(imagePath),
        title: Text(title),
        subtitle: IgnorePointer(
            child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              foregroundColor: item.status.foregroundColor,
              backgroundColor: item.status.backgroundColor),
          onPressed: () {},
          child: Text(item.status.rawValue),
        )),
      ),
    );
  }

  Container buildListItem(News item) {
    return Container(
      key: Key(item.title),
      height: 100,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              foregroundColor:
                  (_isReorderEnabled ? Colors.redAccent : Colors.black),
              padding: const EdgeInsets.all(0),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.zero))),
          onPressed: () {},
          child: Row(
            children: [
              Image.asset(item.category.imagePath),
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
        middle: ElevatedButton(
            onPressed: () {
              setState(() {
                model = fetchNewsList;
              });
            },
            child: Text("Refresh")),
        backgroundColor: Colors.amber,
        leading: IconButton(
            onPressed: () {
              showGeneralDialog(
                  context: context,
                  pageBuilder: (context, anim1, anim2) {
                    return AddNewsPage(
                      onButtonDidClick: onNewsAdded,
                    );
                  },
                  transitionBuilder: (c, a1, a2, child) {
                    return SlideTransition(
                      position: Tween(begin: Offset(0, 1), end: Offset(0, 0))
                          .animate(a1),
                      child: child,
                    );
                  });
            },
            icon: Icon(Icons.add)),
        trailing: ElevatedButton(
          onPressed: () {
            setState(() {
              _isReorderEnabled = !_isReorderEnabled;
            });
          },
          child: Text("Reorder"),
        ));
  }
}
