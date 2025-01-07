import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/data/data_source/local/default_local_starage.dart';
import 'package:flutter_recipe_app_course/data/data_source/local/local_recent_search_recipe_data_source.dart';
import 'package:flutter_recipe_app_course/data/data_source/local/local_storage.dart';
import 'package:flutter_recipe_app_course/data/data_source/remote/remote_recipe_data_source_impl.dart';
import 'package:flutter_recipe_app_course/data/repository/mock_recent_search_recipe_repository_impl.dart';
import 'package:flutter_recipe_app_course/data/repository/mock_recipe_repository_impl.dart';
import 'package:flutter_recipe_app_course/domain/use_case/search_recipes_use_case.dart';
import 'package:flutter_recipe_app_course/presentation/search/screen/search_screen.dart';
import 'package:flutter_recipe_app_course/presentation/search/search_view_model.dart';

final LocalStorage _localStorage = DefaultLocalStorage();

final _recentSearchRecipeRepository = MockRecentSearchRecipeRepositoryImpl(
  localStorage: _localStorage,
);

class SearchRoot extends StatelessWidget {
  const SearchRoot({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = SearchViewModel(
      recentSearchRecipeRepository: _recentSearchRecipeRepository,
      searchRecipesUseCase: SearchRecipesUseCase(
        recipeRepository: MockRecipeRepositoryImpl(
          recipeDataSource: RemoteRecipeDataSourceImpl(),
        ),
        localStorage: _localStorage,
      ),
    );

    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, widget) {
        return SearchScreen(
            state: viewModel.state, onChanged: viewModel.searchRecipes);
      },
    );
  }
}
