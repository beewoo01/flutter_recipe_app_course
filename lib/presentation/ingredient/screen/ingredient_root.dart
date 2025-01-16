import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/core/di/di_setup.dart';
import 'package:flutter_recipe_app_course/core/presentation/components/share_dialog.dart';
import 'package:flutter_recipe_app_course/presentation/ingredient/ingredient_action.dart';
import 'package:flutter_recipe_app_course/presentation/ingredient/ingredient_view_model.dart';
import 'package:flutter_recipe_app_course/presentation/ingredient/screen/ingredient_screen.dart';

class IngredientRoot extends StatelessWidget {
  final int recipeId;

  const IngredientRoot({
    super.key,
    required this.recipeId,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt<IngredientViewModel>();
    viewModel.onAction(IngredientAction.loadRecipe(recipeId));
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, widget) {
        return viewModel.state.recipe == null
            ? Center(child: CircularProgressIndicator())
            : IngredientScreen(
                state: viewModel.state,
                onTapMenu: (menu) {
                  switch (menu) {
                    case IngredientMenu.share:
                      showDialog(
                          context: context,
                          builder: (context) {
                            return ShareDialog(
                              link: "app.Recipe.co/jollof_rice",
                              onTapCopyLink: (link) {
                                viewModel.onAction(
                                    IngredientAction.onTapShareMenu(link));
                                Navigator.pop(context);
                              },
                            );
                          });
                    case IngredientMenu.rate:
                    // TODO: Handle this case.
                    case IngredientMenu.review:
                    // TODO: Handle this case.
                    case IngredientMenu.unSave:
                    // TODO: Handle this case.
                  }
                },
                onAction: viewModel.onAction,
              );
      },
    );
  }
}
