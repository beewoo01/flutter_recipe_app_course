import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/core/presentation/components/filter_button.dart';
import 'package:flutter_recipe_app_course/ui/color_styles.dart';
import 'package:flutter_recipe_app_course/ui/text_styles.dart';

class FilterButtons extends StatelessWidget {
  final List<String> items;
  final String selectedItem;
  final void Function(String item) onSelected;

  const FilterButtons({
    super.key,
    required this.items,
    required this.selectedItem,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: items.expand((e) {
        return [
          GestureDetector(
            onTap: () => onSelected(e),
            child: FilterButton(e, isSelected: e == selectedItem),
          ),
          const SizedBox(
            width: 10,
          )
        ];
      }).toList(),
    );
  }
}
