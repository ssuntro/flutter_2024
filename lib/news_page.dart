import 'package:day_1/models/news.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  static const routeName = 'news-page';
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    final model = arguments["news"] as News?;

    return Scaffold(
      appBar: AppBar(
        title: const Text("baterry lv"),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      child: Text(
                    model?.title ?? "",
                    softWrap: true,
                    style: const TextStyle(fontSize: 18),
                  )),
                  const SizedBox(
                    width: 20,
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: model == null
                            ? null
                            : () {
                                print("Calendar button did click");
                              },
                        child: const Icon(Icons.calendar_month),
                      ),
                      ElevatedButton(
                        onPressed: model == null
                            ? null
                            : () {
                                print("share button did click");
                              },
                        child: const Icon(Icons.ios_share),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            print("Remove button did click");
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.redAccent,
                          ),
                          child: const Icon(Icons.remove_circle)),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Text(model?.body ?? "", softWrap: true),
            ],
          ),
        ),
      )),
    );
  }
}
