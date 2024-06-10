enum NewsCategory { animal, finance, international, unknown }

extension NewsCategoryExtension on NewsCategory {
  String get imagePath {
    switch (this) {
      case NewsCategory.animal:
        return 'assets/images/animal.jpeg';
      case NewsCategory.finance:
        return "assets/images/finance.jpeg";
      case NewsCategory.international:
        return "assets/images/global_warming.jpeg";
      default:
        return "assets/images/default.png";
    }
  }
}
