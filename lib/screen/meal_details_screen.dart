import 'package:flutter/material.dart';
import 'package:meals_app/model/Meal.dart';
// import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/Provider/favourites_provider.dart';

class MealDetailScreen extends ConsumerWidget {
  const MealDetailScreen({
    super.key,
    required this.meal,
    // required this.onSelectedFavourite,
  });

  final Meal meal;
  // final void Function(Meal meal) onSelectedFavourite;

  @override
  Widget build(context, WidgetRef ref) {
    final favouriteMeal = ref.watch(favouriteProvider);

    final isFavourite = favouriteMeal.contains(meal);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              final wasAdded = ref
                  .read(favouriteProvider.notifier)
                  .toggleFavouriteStatus(meal);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    wasAdded
                        ? "Meals added to Favourites"
                        : "Meals removed from Favourites",
                  ),
                ),
              );
              // onSelectedFavourite(meal);
            },
            icon: Icon(
              isFavourite ? Icons.star : Icons.star_border,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 12),
            Text(
              "Ingredients",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),
            for (final ingredient in meal.ingredients)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 5,
                ),
                child: Text(ingredient,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white)),
              ),
            const SizedBox(height: 12),
            Text(
              "Steps",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),
            for (final step in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 5,
                ),
                child: Text(step,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white)),
              ),
          ],
        ),
      ),
    );
  }
}
