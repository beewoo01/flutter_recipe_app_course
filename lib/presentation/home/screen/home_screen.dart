import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/core/presentation/components/dish_card.dart';
import 'package:flutter_recipe_app_course/core/presentation/components/recipe_category_selector.dart';
import 'package:flutter_recipe_app_course/core/presentation/components/search_input_filed.dart';
import 'package:flutter_recipe_app_course/presentation/home/home_state.dart';
import 'package:flutter_recipe_app_course/ui/color_styles.dart';
import 'package:flutter_recipe_app_course/ui/text_styles.dart';

class HomeScreen extends StatelessWidget {
  final String name;
  final void Function() onTapSearchField;
  final void Function(String category) onSelectCategory;
  final HomeState state;

  const HomeScreen({
    super.key,
    required this.name,
    required this.onTapSearchField,
    required this.state,
    required this.onSelectCategory,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello $name",
                          style: TextStyles.largeTextBold,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "What are you cooking today?",
                          style: TextStyles.smallerTextRegular.copyWith(
                            color: ColorStyles.gray3,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: ColorStyles.secondary40,
                          borderRadius: BorderRadius.circular(10)),
                      child: Image.asset('assets/image/face.png'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: onTapSearchField,
                        child: IgnorePointer(
                          child: SearchInputField(
                            placeholder: "Search recipe",
                            isReadOnly: true,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: ColorStyles.primary100,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Icon(
                        Icons.tune,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(
              left: 30,
              top: 10,
              bottom: 10,
            ),
            child: RecipeCategorySelector(
              categories: state.categories,
              selectedCategory: state.selectedCategory,
              onSelectCategory: onSelectCategory,
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: state.dishes
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: DishCard(
                          recipe: e,
                          isFavorite: true,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
