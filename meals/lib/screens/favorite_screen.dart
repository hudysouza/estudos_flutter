import 'package:flutter/material.dart';
import 'package:meals/components/meal_Item.dart';
import 'package:meals/models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen(this._favoriteMeal, {super.key});

  final List<Meal> _favoriteMeal;

  @override
  Widget build(BuildContext context) {
    if (_favoriteMeal.isEmpty) {
      return const Center(
        child: Text('Nenhuma Refeição foi marcada como favorita'),
      );
    } else {
      return ListView.builder(
        itemCount: _favoriteMeal.length,
        itemBuilder: (ctx, index) {
          return MealItem(meal: _favoriteMeal[index]);
        },
      );
    }
  }
}
