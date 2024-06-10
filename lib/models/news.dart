import 'dart:ui';

import 'package:day_1/models/news_category.dart';
import 'package:day_1/models/news_status.dart';

class News {
  final String title;
  final NewsStatus status;
  // final String thumbnail;
  final NewsCategory category;

  News({required this.title, required this.status, required this.category});
}
