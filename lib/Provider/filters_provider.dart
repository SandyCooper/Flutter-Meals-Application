import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/Provider/meals_provider.dart';
// import 'package:meals_app/model/Meal.dart';

enum Filter {
  glutenFree,
  lactosFree,
  vegitarian,
  vegan,
}

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactosFree: false,
          Filter.vegitarian: false,
          Filter.vegan: false,
        });

  void setFilters(Map<Filter, bool> choosenFilter) {
    state = choosenFilter;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
  (ref) => FiltersNotifier(),
);

final filteredMealProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final filterMeal = ref.watch(filtersProvider);
  return meals.where((meal) {
    if (filterMeal[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (filterMeal[Filter.lactosFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (filterMeal[Filter.vegitarian]! && !meal.isVegetarian) {
      return false;
    }
    if (filterMeal[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
