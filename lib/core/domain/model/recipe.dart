import 'package:flutter_recipe_app_course/core/domain/model/recipe_ingredient.dart';

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

class Recipe {
  final int id;
  final String category;
  final String name;
  final String image;
  final String chef;
  final String time;
  final double rating;
  final List<RecipeIngredient> ingredients;

  Recipe({
    required this.id,
    required this.category,
    required this.name,
    required this.image,
    required this.chef,
    required this.time,
    required this.rating,
    required this.ingredients,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'] as int,
      category: json['category'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      chef: json['chef'] as String,
      time: json['time'] as String,
      rating: json['rating'].toDouble(),
      ingredients: (json['ingredients'] as List)
          .map((ingredient) => RecipeIngredient.fromJson(ingredient))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category': category,
      'name': name,
      'image': image,
      'chef': chef,
      'time': time,
      'rating': rating,
      'ingredients': ingredients.map((ingredient) => ingredient.toJson()).toList(),
    };
  }

  @override
  String toString() {
    return 'Recipe(id: $id, category: $category, name: $name, chef: $chef, time: $time, rating: $rating, ingredients: $ingredients)';
  }
}