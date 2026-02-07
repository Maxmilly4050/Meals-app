import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:meals_app/widgets/meal_item_trait.dart';
import 'package:meals_app/widgets/meal_item_details.dart';

class MealItem extends StatelessWidget {

  const MealItem({super.key, required this.meal});

  final Meal meal;

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() + meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() + meal.affordability.name.substring(1);
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealItemDetails(steps: meal.steps, ingredients: meal.ingredients, image: meal.imageUrl, onToggleFavorite: (){},),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      elevation: 2,

      child: InkWell(
        onTap: () => selectMeal(context),
        child: Stack(
          children: [

            FadeInImage(placeholder: MemoryImage(kTransparentImage), 
            image: NetworkImage(meal.imageUrl),
            fit: BoxFit.cover,
            height: 200,
            width: double.infinity,
            ),

            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                color: Colors.black54,
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 44),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      meal.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),

                    SizedBox(height: 12,),

                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        MealItemTrait(icon: Icons.schedule, label: '${meal.duration} min',),
                        const SizedBox(width: 12,),
                        MealItemTrait(icon: Icons.access_time, label: complexityText),
                        const SizedBox(width: 12,),
                        MealItemTrait(icon: Icons.attach_money, label: affordabilityText), 
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        )
      ),
    );
  }

}