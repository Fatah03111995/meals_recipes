// ignore_for_file: public_member_api_docs, sort_constructors_first
enum Complexity {
  simple,
  challenging,
  hard,
}

enum Affordability {
  affordable,
  pricey,
  luxurious,
}

class Meal {
  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.detailIngredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
  });

  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;

  final List<String> ingredients;
  final List<String> detailIngredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  @override
  String toString() {
    return 'Meal(id: $id, categories: $categories, title: $title, imageUrl: $imageUrl, ingredients: $ingredients, detailIngredients: $detailIngredients, steps: $steps, duration: $duration, complexity: $complexity, affordability: $affordability, isGlutenFree: $isGlutenFree, isLactoseFree: $isLactoseFree, isVegan: $isVegan, isVegetarian: $isVegetarian)';
  }
}
