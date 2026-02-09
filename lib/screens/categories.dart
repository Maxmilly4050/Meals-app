import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.onToggleFavorite, required this.availableMeals});
  final void Function(Meal meal) onToggleFavorite;
  final List<Meal> availableMeals;


  void selectCategory(BuildContext context, String categoryId) {
    final filteredMeals =
        availableMeals.where((meal) => meal.categories.contains(categoryId)).toList();
    final category =
        availableCategories.firstWhere((cat) => cat.id == categoryId);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(title: category.title, meals: filteredMeals, onToggleFavorite: onToggleFavorite,),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
          children: [
        for (final category in availableCategories)
          CategoryGridItem(category: category, onSelectCategory: (){
            selectCategory(context, category.id);
          },)
          ],    
          );
  }
}