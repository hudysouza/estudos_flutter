import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/settings.dart';
import 'package:meals/screens/categories_meals_screen.dart';
import 'package:meals/screens/meal_detail_screem.dart';
import 'package:meals/screens/settings_screen.dart';
import 'package:meals/screens/tabs_screen.dart';

import 'models/meal.dart';
import 'utils/app_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _avaibleMeals = dummyMeals;
  final List<Meal> _favoriteMeals = [];
  Settings _settings = Settings();

  void _filterMeals(Settings settings) {
    _settings = settings;
    setState(() {
      _avaibleMeals = dummyMeals.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  final ThemeData theme = ThemeData(
      fontFamily: 'Releway',
      textTheme: ThemeData.light().textTheme.copyWith(
            titleMedium: const TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
            ),
          ),
      canvasColor: const Color.fromRGBO(255, 254, 229, 1));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.pink,
          secondary: Colors.amber,
        ),
      ),
      routes: {
        AppRoutes.home: (ctx) => TabsScreen(_favoriteMeals),
        AppRoutes.categoriesMeals: (ctx) => CategoriesMealsScreen(
              meals: _avaibleMeals,
            ),
        AppRoutes.mealDetail: (ctx) => MealDetailScreen(_toggleFavorite, _isFavorite),
        AppRoutes.settings: (ctx) => SettingScreen(_filterMeals, _settings),
      },
    );
  }
}
