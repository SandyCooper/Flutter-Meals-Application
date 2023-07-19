import 'package:flutter/material.dart';
import 'package:meals_app/model/catagory.dart';

class CatagoryGridItem extends StatelessWidget {
  const CatagoryGridItem({
    super.key,
    required this.catagory,
    required this.onSelectCatagory,
  });

  final Catagory catagory;
  final void Function() onSelectCatagory;

  @override
  Widget build(context) {
    return InkWell(
      onTap: onSelectCatagory,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              catagory.color.withOpacity(0.55),
              catagory.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          catagory.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
