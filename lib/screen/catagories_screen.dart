import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/model/Meal.dart';
import 'package:meals_app/model/catagory.dart';
import 'package:meals_app/screen/meals_screen.dart';
import 'package:meals_app/widget/catagory_grid_item.dart';

class CatagoriesScreen extends StatefulWidget {
  const CatagoriesScreen({
    super.key,
    // required this.onSelectedFavourite,
    required this.onSelectedFilter,
  });

  // final void Function(Meal meal) onSelectedFavourite;
  final List<Meal> onSelectedFilter;

  @override
  State<CatagoriesScreen> createState() => _CatagoriesScreenState();
}

class _CatagoriesScreenState extends State<CatagoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void selectCatagory(BuildContext context, Catagory catagory) {
    final filteredMeals = widget.onSelectedFilter
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
    return AnimatedBuilder(
      animation: animationController,
      child: GridView(
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
      ),
      builder: (context, child) => SlideTransition(
        position: Tween(
          begin: const Offset(0, 0.3),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
            parent: animationController,
            curve: Curves.easeInOut,
          ),
        ),child: child,
      ),
      // Padding(
      //   padding: EdgeInsets.only(top: 100 - animationController.value * 100),
      //   child: child,
      // ),
    );
  }
}
