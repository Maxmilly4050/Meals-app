import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget{
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen>{

  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            title: Text('Gluten-free',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            subtitle: Text('Only include gluten free meals'),
            activeThumbColor: Theme.of( context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34, right: 22),
            value: _glutenFreeFilterSet,
            onChanged: (value) {
              setState(() {
                _glutenFreeFilterSet = value;
              });
            },
          ),
          SwitchListTile(
            title: Text('Lactose-free',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            subtitle: Text('Only include lactose free meals'),
            activeThumbColor: Theme.of( context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34, right: 22),
            value: _lactoseFreeFilterSet,
            onChanged: (value) {
              setState(() {
                _lactoseFreeFilterSet = value;
              });
            },
          ),
        ],
      )
    );
  }
}