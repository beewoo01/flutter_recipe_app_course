import 'package:flutter_recipe_app_course/data/data_source/local/local_storage.dart';
import 'package:flutter_recipe_app_course/domain/model/recipe.dart';
import 'package:flutter_recipe_app_course/domain/repository/recipe_repository.dart';

class SearchRecipesUseCase {
  final RecipeRepository _recipeRepository;
  final LocalStorage _localStorage;

  const SearchRecipesUseCase({
    required RecipeRepository recipeRepository,
    required LocalStorage localStorage,
  })  : _recipeRepository = recipeRepository,
        _localStorage = localStorage;

  Future<List<Recipe>> execute(String query) async {
    final result = (await _recipeRepository.getRecipes()).where(
      (e) => e.name.toLowerCase().contains(
            query.toLowerCase(),
          ),
    );

    _localStorage.save({
      'recipes': result.map(
        (e) => e.toJson(),
      ),
    });

    return result.toList();
  }
}
