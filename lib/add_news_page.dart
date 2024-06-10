import 'package:day_1/models/news.dart';
import 'package:day_1/models/news_category.dart';
import 'package:day_1/models/news_status.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddNewsPage extends StatelessWidget {
  final void Function(News) onButtonDidClick;
  AddNewsPage({super.key, required this.onButtonDidClick});

  final model = News(
      title:
          "Breaking news Breaking newsBreaking newsBreaking news${DateTime.now().toString()}",
      status: NewsStatus.pendingResponse,
      category: NewsCategory.animal,
      body:
          "ntentdsadklfhf;afdsadklfh;hf;afcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentdsadklfh;hf;afdsadklfh;hf;",
      url: 'google.com');

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('add_news_page'),
      direction: DismissDirection.down,
      onDismissed: (_) => Navigator.pop(context),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add news"),
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                buildFirstLine(context),
                const SizedBox(
                  height: 100,
                ),
                Text(
                  model.body,
                  softWrap: true,
                ),
                const SizedBox(
                  height: 100,
                ),
                buildBottomSection()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildFirstLine(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            model.title,
            softWrap: true,
            style: TextStyle(fontSize: 18),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              onButtonDidClick(model);
              Navigator.of(context).pop();
            },
            child: Text("Add"))
      ],
    );
  }

  Widget buildBottomSection() {
    return Column(
      children: [
        Row(
          children: [
            Text("url: ", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(model.url)
          ],
        ),
        Row(
          children: [
            Text("status: ", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(model.status.rawValue.toUpperCase()),
          ],
        ),
        Row(
          children: [
            Text("Category: ", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(model.category.toString().toUpperCase())
          ],
        )
      ],
    );
  }
}
