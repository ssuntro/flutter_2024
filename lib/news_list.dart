import 'dart:convert';
import 'dart:io';

import 'package:day_1/models/news.dart';
import 'package:day_1/models/news_category.dart';
import 'package:day_1/models/news_status.dart';
import 'package:http/http.dart' as http;

class NewsList {
  static Future<List<News>> fetchAPI() {
    return http
        .get(Uri.parse(
            'https://www.hackingwithswift.com/samples/petitions-2.json'))
        .then((response) {
      if (response.statusCode >= 400) {
        throw HttpException("Error ja ${response.statusCode}");
      }

      final data = json.decode(response.body) as Map<String, dynamic>;
      final animals = (data["results"] as List<dynamic>).take(5).map((item) {
        return News(
            title: (item["title"] is String)
                ? (item["title"] as String)
                : throw FormatException(),
            status: NewsStatus.pendingResponse,
            category: NewsCategory.finance,
            body: "",
            url: "");
      }).toList();

      return animals;
    });
  }
}
