import 'package:flutter/material.dart';
import 'package:meals_app/Provider/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/widget/switch_list_Tile.dart';

// enum Filter {
//   glutenFree,
//   lactosFree,
//   vegitarian,
//   vegan,
// }

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({
    super.key,
    // required this.currentFilter,
  });

  // final Map<Filter, bool> currentFilter;

//   @override
//   ConsumerState<FiltersScreen> createState() {
//     return _FiltersScreenState();
//   }
// }

// class _FiltersScreenState extends ConsumerState<FiltersScreen> {
//   var glutenFreeFilter = false;
//   var lactosFreeFilter = false;
//   var vegitarianFilter = false;
//   var veganFilter = false;

//   @override
//   void initState() {
//     super.initState();
//     final activeFilter = ref.read(filtersProvider);
//     glutenFreeFilter = activeFilter[Filter.glutenFree]!;
//     lactosFreeFilter = activeFilter[Filter.lactosFree]!;
//     vegitarianFilter = activeFilter[Filter.vegitarian]!;
//     veganFilter = activeFilter[Filter.vegan]!;
//   }

  @override
  Widget build(context, WidgetRef ref) {
    // final activeFilter = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Your Filters",
        ),
      ),
      body:
          // WillPopScope(
          //   onWillPop: () async {
          //     ref.read(filtersProvider.notifier).setFilters({
          //       Filter.glutenFree: glutenFreeFilter,
          //       Filter.lactosFree: lactosFreeFilter,
          //       Filter.vegitarian: vegitarianFilter,
          //       Filter.vegan: veganFilter,
          //     });
          //     // Navigator.of(context).pop();
          //     return true;
          //   },
          // child:
          const Column(
        children: [
          ToggleSwitch(filter: Filter.glutenFree,text: "Gluten-Free"),
          ToggleSwitch(filter: Filter.lactosFree,text: "Lactos-Free"),
          ToggleSwitch(filter: Filter.vegitarian,text: "Vegetarian"),
          ToggleSwitch(filter: Filter.vegan,text: "Vegan"),
          // SwitchListTile(
          //   value: activeFilter[Filter.glutenFree]!,
          //   onChanged: (isChecked) {
          //     ref
          //         .read(filtersProvider.notifier)
          //         .setFilter(Filter.glutenFree, isChecked);
          //   },
          //   title: Text(
          //     "Gluten-free",
          //     style: Theme.of(context).textTheme.titleLarge!.copyWith(
          //           color: Theme.of(context).colorScheme.onBackground,
          //         ),
          //   ),
          //   subtitle: Text(
          //     "Only includes Gluten-free meals",
          //     style: Theme.of(context).textTheme.labelMedium!.copyWith(
          //           color: Theme.of(context).colorScheme.onBackground,
          //         ),
          //   ),
          //   activeColor: Theme.of(context).colorScheme.tertiary,
          //   contentPadding: const EdgeInsets.only(left: 34, right: 22),
          // ),
          // SwitchListTile(
          //   value: activeFilter[Filter.lactosFree]!,
          //   onChanged: (isChecked) {
          //     ref
          //         .read(filtersProvider.notifier)
          //         .setFilter(Filter.lactosFree, isChecked);
          //   },
          //   title: Text(
          //     "Lactos-free",
          //     style: Theme.of(context).textTheme.titleLarge!.copyWith(
          //           color: Theme.of(context).colorScheme.onBackground,
          //         ),
          //   ),
          //   subtitle: Text(
          //     "Only includes Lactos-free meals",
          //     style: Theme.of(context).textTheme.labelMedium!.copyWith(
          //           color: Theme.of(context).colorScheme.onBackground,
          //         ),
          //   ),
          //   activeColor: Theme.of(context).colorScheme.tertiary,
          //   contentPadding: const EdgeInsets.only(left: 34, right: 22),
          // ),
          // SwitchListTile(
          //   value: activeFilter[Filter.vegitarian]!,
          //   onChanged: (isChecked) {
          //     ref
          //         .read(filtersProvider.notifier)
          //         .setFilter(Filter.vegitarian, isChecked);
          //   },
          //   title: Text(
          //     "Vegitarian",
          //     style: Theme.of(context).textTheme.titleLarge!.copyWith(
          //           color: Theme.of(context).colorScheme.onBackground,
          //         ),
          //   ),
          //   subtitle: Text(
          //     "Only includes Vegitarian meals",
          //     style: Theme.of(context).textTheme.labelMedium!.copyWith(
          //           color: Theme.of(context).colorScheme.onBackground,
          //         ),
          //   ),
          //   activeColor: Theme.of(context).colorScheme.tertiary,
          //   contentPadding: const EdgeInsets.only(left: 34, right: 22),
          // ),
          // SwitchListTile(
          //   value: activeFilter[Filter.vegan]!,
          //   onChanged: (isChecked) {
          //     ref
          //         .read(filtersProvider.notifier)
          //         .setFilter(Filter.vegan, isChecked);
          //   },
          //   title: Text(
          //     "Vegan",
          //     style: Theme.of(context).textTheme.titleLarge!.copyWith(
          //           color: Theme.of(context).colorScheme.onBackground,
          //         ),
          //   ),
          //   subtitle: Text(
          //     "Only includes Vegan meals",
          //     style: Theme.of(context).textTheme.labelMedium!.copyWith(
          //           color: Theme.of(context).colorScheme.onBackground,
          //         ),
          //   ),
          //   activeColor: Theme.of(context).colorScheme.tertiary,
          //   contentPadding: const EdgeInsets.only(left: 34, right: 22),
          // ),
        ],
      ),
    );
    // );
  }
}
