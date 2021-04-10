import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget{
  List<Meal> favorite;
  FavoritesScreen(this.favorite);
  @override
  Widget build(BuildContext context) {
    if (favorite.isEmpty) {
      return Center(
        child: Text(
          'You have no favorites yet - Start adding some',
        ),
      );
    }else {
      return ListView.builder(itemBuilder: (ctx,index) {
        return MealItem(
          id: favorite[index].id, title :favorite[index].title,
          affordability: favorite[index].affordability,
          complexity: favorite[index].complexity,duration: favorite[index].duration,
          imageUrl: favorite[index].imageUrl,
          //,removeItem: _removeMeal,
        );
      },
        itemCount: favorite.length,);
    }
  }
  
}