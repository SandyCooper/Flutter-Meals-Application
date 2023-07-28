import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/model/Meal.dart';
import 'package:meals_app/model/catagory.dart';
import 'package:meals_app/screen/meals_screen.dart';
import 'package:meals_app/widget/catagory_grid_item.dart';

class CatagoriesScreen extends StatelessWidget {
  const CatagoriesScreen({
    super.key,
    // required this.onSelectedFavourite,
    required this.onSelectedFilter,
  });

  // final void Function(Meal meal) onSelectedFavourite;
  final List<Meal> onSelectedFilter;

  void selectCatagory(BuildContext context, Catagory catagory) {
    final filteredMeals = onSelectedFilter
        .where(
          (meal) => meal.categories.contains(catagory.id),
        )
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: catagory.title,
          meals: filteredMeals,
          // onSelectedFavourite: onSelectedFavourite,
        ),
      ),
    );
  }

  @override
  Widget build(context) {
    return GridView(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final catagory in availableCatagories)
          CatagoryGridItem(
            catagory: catagory,
            onSelectCatagory: () {
              selectCatagory(context, catagory);
            },
          ),
      ],
    );
  }
}
