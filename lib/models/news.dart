import 'dart:ui';

import 'package:day_1/models/news_category.dart';
import 'package:day_1/models/news_status.dart';

class News {
  final String title;
  final String body;
  final String url;
  final NewsStatus status;
  final NewsCategory category;

  News(
      {required this.title,
      required this.status,
      required this.category,
      required this.body,
      required this.url});

  @override
  String toString() {
    return title;
  }
}
