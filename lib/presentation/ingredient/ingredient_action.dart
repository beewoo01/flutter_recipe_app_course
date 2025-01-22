import 'package:flutter/foundation.dart';
import 'package:flutter_recipe_app_course/domain/model/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient_action.freezed.dart';

@freezed
sealed class IngredientAction with _$IngredientAction {
  const factory IngredientAction.onTapFavorite(Recipe recipe) = OnTapFavorite;

  const factory IngredientAction.onTapIngredient() = OnTapIngredient;

  const factory IngredientAction.onTapProcedure() = OnTapProcedure;

  const factory IngredientAction.onTapFollow(Recipe recipe) = OnTapFollow;

  const factory IngredientAction.loadRecipe(int recipeId) = LoadRecipe;

  const factory IngredientAction.onTapShareMenu(String link) = OnTapShareMenu;

  const factory IngredientAction.onTapShareRateRecipe(Recipe recipe, int rate) =
      OnTapShareRateRecipe;

  const factory IngredientAction.onTapUnSave(Recipe recipe) = OnTapUnSave;
}
