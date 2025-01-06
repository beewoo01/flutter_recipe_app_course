import 'package:flutter_recipe_app_course/data/data_source/remote/recipe_data_source.dart';
import 'package:flutter_recipe_app_course/domain/model/recipe.dart';
import 'package:flutter_recipe_app_course/domain/repository/recipe_repository.dart';

class MockRecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource _recipeDataSource;

  const MockRecipeRepositoryImpl({
    required RecipeDataSource recipeDataSource,
  }) : _recipeDataSource = recipeDataSource;

  @override
  Future<Recipe?> getRecipe(int id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final recipes = await getRecipes();
    return recipes.where((e) => e.id == id).firstOrNull;
  }

  @override
  Future<List<Recipe>> getRecipes() async {
    final recipes = await _recipeDataSource.getRecipes();
    return recipes.map((e) => Recipe.fromJson(e)).toList();
  }
}
