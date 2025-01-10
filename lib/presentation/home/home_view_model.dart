import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/core/domain/error/network_error.dart';
import 'package:flutter_recipe_app_course/core/domain/error/result.dart';
import 'package:flutter_recipe_app_course/domain/use_case/get_categories_use_case.dart';
import 'package:flutter_recipe_app_course/domain/use_case/get_dishes_by_category_use_case.dart';
import 'package:flutter_recipe_app_course/presentation/home/home_state.dart';

class HomeViewModel with ChangeNotifier {
  final GetCategoriesUseCase _getCategoriesUseCase;
  final GetDishesByCategoryUseCase _getDishesByCategoryUseCase;

  final _eventController = StreamController<NetworkError>();

  Stream<NetworkError> get eventStream => _eventController.stream;

  HomeViewModel({
    required GetCategoriesUseCase getCategoriesUseCase,
    required GetDishesByCategoryUseCase getDishesByCategoryUseCase,
  })  : _getCategoriesUseCase = getCategoriesUseCase,
        _getDishesByCategoryUseCase = getDishesByCategoryUseCase {
    _fetchCategories();
  }

  HomeState _state = const HomeState();

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
    final dishes = await _getDishesByCategoryUseCase.execute(category);
    _state = _state.copyWith(dishes: dishes);
    notifyListeners();
  }

  void onSelectCategory(String category) async {
    _state = state.copyWith(selectedCategory: category);
    notifyListeners();

    await _fetchDishesByCategory(category);
  }
}
