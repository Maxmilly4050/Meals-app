import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meal.dart';

class FavoriteMealsProvider extends StateNotifier<List<Meal>> {
  FavoriteMealsProvider() : super([]);

  void toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    if(mealIsFavorite){
      state = state.where((m) => m.id != meal.id).toList();
    } else {
      state = [...state, meal];
    }
  }

}

final favoriteMealsProvider = StateNotifierProvider<FavoriteMealsProvider, List<Meal>>(
    (ref) => FavoriteMealsProvider()
  );