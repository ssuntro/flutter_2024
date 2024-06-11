import 'dart:convert';
import 'dart:io';

import 'package:day_1/models/news.dart';
import 'package:day_1/models/news_category.dart';
import 'package:day_1/models/news_status.dart';
import 'package:http/http.dart' as http;

class NewsList {
  static Future<List<News>> fetchAPI() async {
    try {
      final response = await http.get(Uri.parse(
          'https://www.hackingwithswift.com/samples/petitions-2.json'));

      if (response.statusCode >= 400) {
        throw HttpException("Error ja ${response.statusCode}");
      }

      final data = json.decode(response.body) as Map<String, dynamic>;
      final animalList = (data["results"] as List<dynamic>).take(5).map((item) {
        return News(
          title: (item["title"] is String)
              ? (item["title"] as String)
              : throw const FormatException(),
          body: (item["body"] is String) ? (item["body"] as String) : "",
          url: (item["url"] is String) ? (item["url"] as String) : "",
          status: (item["status"] is String)
              ? NewsStatus.values
                  .firstWhere((e) => e.rawValue == item["status"])
              : NewsStatus.closed,
          category: NewsCategory.animal,
        );
      }).toList();

      final internationalList =
          (data["results"] as List<dynamic>).getRange(5, 9).map((item) {
        return News(
          title: (item["title"] is String)
              ? (item["title"] as String)
              : throw const FormatException(),
          body: (item["body"] is String) ? (item["body"] as String) : "",
          url: (item["url"] is String) ? (item["url"] as String) : "",
          status: (item["status"] is String)
              ? NewsStatus.values
                  .firstWhere((e) => e.rawValue == item["status"])
              : NewsStatus.closed,
          category: NewsCategory.international,
        );
      }).toList();

      final financeList =
          (data["results"] as List<dynamic>).getRange(10, 14).map((item) {
        return News(
          title: (item["title"] is String)
              ? (item["title"] as String)
              : throw const FormatException(),
          body: (item["body"] is String) ? (item["body"] as String) : "",
          url: (item["url"] is String) ? (item["url"] as String) : "",
          status: (item["status"] is String)
              ? NewsStatus.values
                  .firstWhere((e) => e.rawValue == item["status"])
              : NewsStatus.closed,
          category: NewsCategory.finance,
        );
      }).toList();

      return [...animalList, ...internationalList, ...financeList];
    } catch (error) {
      return <News>[];
    }

    // return http
    //     .get(Uri.parse(
    //         'https://www.hackingwithswift.com/samples/petitions-2.json'))
    //     .then((response) {});
  }
}
