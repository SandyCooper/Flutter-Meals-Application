import 'package:flutter/material.dart';
import 'package:meals_app/model/Meal.dart';
import 'package:meals_app/screen/meal_details_screen.dart';
// import 'package:meals_app/model/catagory.dart';
import 'package:meals_app/widget/meal_iten.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    required this.meals,
    this.title,
    // required this.onSelectedFavourite,
  });

  final String? title;
  final List<Meal> meals;
  // final void Function(Meal meal) onSelectedFavourite;

  void selectedMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailScreen(meal: meal,
        //  onSelectedFavourite: onSelectedFavourite,
         ),
      ),
    );
  }

  @override
  Widget build(context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Uh no..."),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Try selecting some other catagory",
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) =>
            MealItem(meal: meals[index], onSelectedMeal: selectedMeal),
      );
    }

    if (title == null) {
      return content;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
