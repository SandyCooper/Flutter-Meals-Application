import 'package:flutter/material.dart';

enum Filter {
  glutenFree,
  lactosFree,
  vegitarian,
  vegan,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({
    super.key,
    required this.currentFilter,
  });

  final Map<Filter, bool> currentFilter;

  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  var glutenFreeFilter = false;
  var lactosFreeFilter = false;
  var vegitarianFilter = false;
  var veganFilter = false;

  @override
  void initState() {
    super.initState();
    glutenFreeFilter = widget.currentFilter[Filter.glutenFree]!;
    lactosFreeFilter = widget.currentFilter[Filter.lactosFree]!;
    vegitarianFilter = widget.currentFilter[Filter.vegitarian]!;
    veganFilter = widget.currentFilter[Filter.vegan]!;
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Your Filters",
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenFree: glutenFreeFilter,
            Filter.lactosFree: lactosFreeFilter,
            Filter.vegitarian: vegitarianFilter,
            Filter.vegan: veganFilter,
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: glutenFreeFilter,
              onChanged: (isChecked) {
                setState(() {
                  glutenFreeFilter = isChecked;
                });
              },
              title: Text(
                "Gluten-free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                "Only includes Gluten-free meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: lactosFreeFilter,
              onChanged: (isChecked) {
                setState(() {
                  lactosFreeFilter = isChecked;
                });
              },
              title: Text(
                "Lactos-free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                "Only includes Lactos-free meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: vegitarianFilter,
              onChanged: (isChecked) {
                setState(() {
                  vegitarianFilter = isChecked;
                });
              },
              title: Text(
                "Vegitarian",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                "Only includes Vegitarian meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: veganFilter,
              onChanged: (isChecked) {
                setState(() {
                  veganFilter = isChecked;
                });
              },
              title: Text(
                "Vegan",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                "Only includes Vegan meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}
