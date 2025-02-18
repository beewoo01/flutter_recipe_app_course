import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/core/domain/error/network_error.dart';
import 'package:flutter_recipe_app_course/core/domain/error/result.dart';
import 'package:flutter_recipe_app_course/domain/error/bookmark_error.dart';
import 'package:flutter_recipe_app_course/domain/error/new_recipe_error.dart';
import 'package:flutter_recipe_app_course/domain/model/recipe.dart';
import 'package:flutter_recipe_app_course/domain/repository/bookmark_repository.dart';
import 'package:flutter_recipe_app_course/domain/use_case/get_categories_use_case.dart';
import 'package:flutter_recipe_app_course/domain/use_case/get_dishes_by_category_use_case.dart';
import 'package:flutter_recipe_app_course/domain/use_case/get_new_recipes_use_case.dart';
import 'package:flutter_recipe_app_course/domain/use_case/toggle_bookmark_recipe_use_case.dart';
import 'package:flutter_recipe_app_course/presentation/home/home_action.dart';
import 'package:flutter_recipe_app_course/presentation/home/home_state.dart';

class HomeViewModel with ChangeNotifier {
  final GetCategoriesUseCase _getCategoriesUseCase;
  final GetDishesByCategoryUseCase _getDishesByCategoryUseCase;
  final GetNewRecipesUseCase _getNewRecipesUseCase;
  final ToggleBookmarkRecipeUseCase _toggleBookmarkRecipeUseCase;
  StreamSubscription? _streamSubscription;

  final _eventController = StreamController<NetworkError>();

  Stream<NetworkError> get eventStream => _eventController.stream;

  HomeViewModel({
    required GetCategoriesUseCase getCategoriesUseCase,
    required GetDishesByCategoryUseCase getDishesByCategoryUseCase,
    required GetNewRecipesUseCase getNewRecipesUseCase,
    required ToggleBookmarkRecipeUseCase toggleBookmarkRecipeUseCase,
  })  : _getCategoriesUseCase = getCategoriesUseCase,
        _getDishesByCategoryUseCase = getDishesByCategoryUseCase,
        _getNewRecipesUseCase = getNewRecipesUseCase,
        _toggleBookmarkRecipeUseCase = toggleBookmarkRecipeUseCase {
    _fetchCategories();
    _fetchNewRecipes();
  }

  HomeState _state = const HomeState(name: 'Jega');

  HomeState get state => _state;

  void _fetchCategories() async {
    final result = await _getCategoriesUseCase.execute();
    switch (result) {
      case ResultSuccess<List<String>, NetworkError>():
        _state = _state.copyWith(
          categories: result.data,
          selectedCategory: "All",
        );

        notifyListeners();

        await _fetchDishesByCategory('All');
        notifyListeners();
        break;

      case ResultError<List<String>, NetworkError>():
        switch (result.error) {
          case NetworkError.requestTimeOut:
          case NetworkError.noInternet:
          // TODO: Handle this case.
          case NetworkError.serverError:
          // TODO: Handle this case.
          case NetworkError.unknown:
          // TODO: Handle this case.
        }

        log(result.error.toString());
        _eventController.add(result.error);
    }
  }

  Future<void> _fetchDishesByCategory(String category) async {
    _streamSubscription = _getDishesByCategoryUseCase.execute(category).listen((dishes) {
      _state = state.copyWith(dishes: dishes);
      notifyListeners();
    });
  }

  Future<void> _fetchNewRecipes() async {
    final result = await _getNewRecipesUseCase.execute();
    switch (result) {
      case ResultSuccess<List<Recipe>, NewRecipeError>():
        _state = state.copyWith(newRecipes: result.data);
        notifyListeners();

      case ResultError<List<Recipe>, NewRecipeError>():
        switch (result.error) {
          case NewRecipeError.noRecipe:
          // TODO: Handle this case.
          case NewRecipeError.invalidCategory:
          // TODO: Handle this case.
          case NewRecipeError.unknown:
          // TODO: Handle this case.
        }
    }
  }

  void _onSelectCategory(String category) async {
    _state = state.copyWith(selectedCategory: category);
    notifyListeners();

    await _fetchDishesByCategory(category);
  }

  void _onTapFavorite(Recipe recipe) async {
    final result = await _toggleBookmarkRecipeUseCase.execute(recipe.id);
    switch(result) {
      case ResultSuccess<List<Recipe>, BookMarkError>() :
        _state = state.copyWith(dishes: result.data);
        notifyListeners();
      case ResultError<List<Recipe>, BookMarkError>() :
        switch(result.error) {

          case BookMarkError.notFound:
            // TODO: Handle this case.
          case BookMarkError.saveFailed:
            // TODO: Handle this case.
          case BookMarkError.unknown:
            // TODO: Handle this case.
        }

    }
  }

  void onAction(HomeAction action) async {
    switch (action) {
      case OnTapSearchField():
        return;
      case OnSelectCategory():
        _onSelectCategory(action.category);
      case onTapFavorite():
        _onTapFavorite(action.recipe);
    }
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    super.dispose();
  }
}
