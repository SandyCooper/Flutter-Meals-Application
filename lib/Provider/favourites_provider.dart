import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:meals_app/model/Meal.dart";

class FavouriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavouriteMealsNotifier() : super([]);

  bool toggleFavouriteStatus(Meal meal) {
    final mealIsExisting = state.contains(meal);

    if (mealIsExisting) {
      state = state
          .where(
            (m) => m.id != meal.id,
          )
          .toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favouriteProvider =
    StateNotifierProvider<FavouriteMealsNotifier, List<Meal>>(
  (ref) => FavouriteMealsNotifier(),
);
