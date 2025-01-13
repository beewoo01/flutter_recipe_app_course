import 'package:flutter_recipe_app_course/domain/model/recipe.dart';

class RecipeModel {
  final List<Recipe> recipes;

  RecipeModel({
    required this.recipes,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      recipes: (json['recipes'] as List)
          .map((recipe) => Recipe.fromJson(recipe))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'recipes': recipes.map((recipe) => recipe.toJson()).toList(),
    };
  }

  @override
  String toString() {
    return 'RecipeModel(recipes: $recipes)';
  }
}