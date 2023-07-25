import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/model/Meal.dart';
import 'package:meals_app/screen/catagories_screen.dart';
import 'package:meals_app/screen/filters_screen.dart';
import 'package:meals_app/screen/meals_screen.dart';
import 'package:meals_app/widget/main_drawer.dart';

const kFilteredMeal = {
  Filter.glutenFree: false,
  Filter.lactosFree: false,
  Filter.vegitarian: false,
  Filter.vegan: false,
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int selectedPageIndex = 0;
  final List<Meal> favouriteMeal = [];
  Map<Filter, bool> selectedMeal = kFilteredMeal;

  void selectedScreenDrawer(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == "filters") {
      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(
      //     builder: (ctx) => const FiltersScreen(),
      //   ),
      // );
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => FiltersScreen(currentFilter: selectedMeal,),
        ),
      );
      setState(() {
        selectedMeal = result ?? kFilteredMeal;
      });
    }
  }

  void selectedPage(index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  void showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
        ),
      ),
    );
  }

  void toggleFavouriteMealStatus(Meal meal) {
    final isExisting = favouriteMeal.contains(meal);

    if (isExisting) {
      setState(() {
        favouriteMeal.remove(meal);
        showInfoMessage("Meal no longer a Favourite");
      });
    } else {
      setState(() {
        favouriteMeal.add(meal);
        showInfoMessage("Meal now added to Favourite");
      });
    }
  }

  @override
  Widget build(context) {
    final availableFilteredMeal = dummyMeals.where((meal) {
      if (selectedMeal[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (selectedMeal[Filter.lactosFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (selectedMeal[Filter.vegitarian]! && !meal.isVegetarian) {
        return false;
      }
      if (selectedMeal[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    Widget activeScreen = CatagoriesScreen(
      onSelectedFavourite: toggleFavouriteMealStatus,
      onSelectedFilter: availableFilteredMeal,
    );
    var activePageTitle = "Catagories";

    if (selectedPageIndex == 1) {
      activeScreen = MealsScreen(
        meals: favouriteMeal,
        onSelectedFavourite: toggleFavouriteMealStatus,
      );

      activePageTitle = "Your Favourites";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectedScreen: selectedScreenDrawer,
      ),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          selectedPage(index);
        },
        currentIndex: selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.set_meal,
            ),
            label: "Catagories",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
            ),
            label: "Favourites",
          ),
        ],
      ),
    );
  }
}
