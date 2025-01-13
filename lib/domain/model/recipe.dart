import 'package:flutter_recipe_app_course/domain/model/recipe_ingredient.dart';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

@freezed
class Recipe with _$Recipe {
  const factory Recipe({
    required int id,
    required String category,
    required String name,
    required String image,
    required String chef,
    required String time,
    required double rating,
    required List<RecipeIngredient> ingredients,
    @Default(false) bool isFavorite,
  }) = _Recipe;



  factory Recipe.fromJson(Map<String, dynamic> json) =>
      _$RecipeFromJson(json);
}
