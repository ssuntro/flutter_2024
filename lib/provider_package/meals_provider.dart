import 'package:flutter/cupertino.dart';

class MealsProvider with ChangeNotifier {
  List<Meal> _items = [];

  List<Meal> get items {
    return [..._items];
  }

  void appendMeal(Meal meal) {
    _items.add(meal);
    notifyListeners();
  }
}

class Meal {
  final String name;
  final String id;

  Meal({required this.name, required this.id});
}
