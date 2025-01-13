import 'package:flutter_recipe_app_course/core/domain/error/error.dart';

enum NewRecipeError implements Error {
  noRecipe,
  invalidCategory,
  unknown;
}
