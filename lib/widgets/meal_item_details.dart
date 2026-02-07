import 'package:flutter/material.dart';

class MealItemDetails extends StatelessWidget {
  const MealItemDetails({super.key, required this.steps, required this.ingredients, required this.image, required this.onToggleFavorite});

  final List<String> steps;
  final List<String> ingredients;
  final String image;
  final void Function() onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: onToggleFavorite,
          )
        ],
      ),
      body: ListView(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(image, height: 250, width: double.infinity, fit: BoxFit.cover),
          ),
          const SizedBox(height: 12,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Ingredients', style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).colorScheme.onPrimaryContainer),)
            ],
          ),
          const SizedBox(height: 12,),
          for (final ingredient in ingredients)
            ListTile(
              title: Text(ingredient, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onSurface),),

            ),
            const SizedBox(height: 12,),
            Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.list, color: Colors.white,),
                    const SizedBox(width: 12,),
                    Text('Steps', style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),)
                  ],
                ),
                const SizedBox(height: 12,),
                for (final step in steps)
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('${steps.indexOf(step) + 1}'),
                    ),
                    title: Text(step, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),),
                  )
              ],
            )
        ],
      ),
    );

  }
}