import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    super.key,
    required this.onSelectedScreen,
  });

  final void Function(String identifier) onSelectedScreen;

  @override
  Widget build(context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.7),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 40,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                const SizedBox(width: 12),
                Text(
                  "Cooking Up!",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.restaurant,
              size: 30,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title: Text(
              "Meals",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 20,
                  ),
            ),
            onTap: () {
              onSelectedScreen("meals");
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 30,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title: Text(
              "Filter",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 20,
                  ),
            ),
            onTap: () {
              onSelectedScreen("filters");
            },
          ),
        ],
      ),
    );
  }
}
