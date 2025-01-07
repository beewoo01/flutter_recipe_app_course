import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/core/presentation/components/recipe_card.dart';
import 'package:flutter_recipe_app_course/core/presentation/components/recipe_grid_item.dart';
import 'package:flutter_recipe_app_course/core/presentation/components/search_input_filed.dart';
import 'package:flutter_recipe_app_course/presentation/search/search_state.dart';
import 'package:flutter_recipe_app_course/ui/color_styles.dart';
import 'package:flutter_recipe_app_course/ui/text_styles.dart';

class SearchScreen extends StatelessWidget {
  final SearchState state;
  final void Function(String)? onChanged;

  const SearchScreen({
    super.key,
    required this.state,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search recipes",
          style: TextStyles.mediumTextBold,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 17,
            ),
            Row(
              children: [
                Expanded(
                  child: SearchInputField(
                    placeholder: "Search recipe",
                    isReadOnly: false,
                    onChanged: onChanged,
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
            const SizedBox(
              height: 20,
            ),

            /// 기령이 회사 사람들
            /// 대다수가 마치고 남아서 공부함 프로그램 만지고 하다가 간다.
            /// 빨리가면 8시 늦게가면 10시까지도 만들기도 한다.
            /// 일이 아니라 자기개발식으로 만든다.
            /// 정확하게 하는게 앱개발
            /// 테니스 용품 테니스 관련 개발하고 만드는거
            /// 업무 시간 외에 자기가 하고싶은거 한다.

            Row(
              children: [
                Text(
                  state.searchTitle,
                  style: TextStyles.normalTextBold,
                ),
                Spacer(),
                Text(state.resultsCount,
                  style: TextStyles.smallerTextRegular.copyWith(
                    color: ColorStyles.gray3,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: state.isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                      ),
                      itemCount: state.recipes.length,
                      itemBuilder: (context, index) {
                        final recipe = state.recipes[index];
                        return RecipeGridItem(recipe: recipe);
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }
}
