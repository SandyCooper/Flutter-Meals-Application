import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/Provider/filters_provider.dart';

class ToggleSwitch extends ConsumerWidget {
  const ToggleSwitch({super.key, required this.filter, required this.text});

  final Filter filter;
  final String text;

  @override
  Widget build(context, WidgetRef ref) {
    final activeFilter = ref.watch(filtersProvider);
    return SwitchListTile(
      value: activeFilter[filter]!,
      onChanged: (isChecked) {
        ref
            .read(filtersProvider.notifier)
            .setFilter(filter, isChecked);
      },
      title: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      subtitle: Text(
        "Only includes $text meals",
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );
  }
}
