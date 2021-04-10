import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget{
  static const routeName = '/category-meals';

  final List<Meal> _availableMeals;
  CategoryMealsScreen(this._availableMeals);

  @override
  CategoryMealScreenState createState() => CategoryMealScreenState();
}
class CategoryMealScreenState extends State<CategoryMealsScreen>{
  String categoryTitle;
  List<Meal> categoryMeals;
  var _loadedInitData = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData){
      final routeArgs = ModalRoute.of(context).settings.arguments as Map<String,String>;
      final categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title'];
      categoryMeals = widget._availableMeals.where( (meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal (String mealId){
    setState(() {
      categoryMeals.removeWhere((meal) => meal.id == mealId);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle),),
      body: ListView.builder(itemBuilder: (ctx,index) {
        return MealItem(
          id: categoryMeals[index].id, title :categoryMeals[index].title,
          affordability: categoryMeals[index].affordability,
          complexity: categoryMeals[index].complexity,duration: categoryMeals[index].duration,
          imageUrl: categoryMeals[index].imageUrl,
          //removeItem: _removeMeal,
        );
      },
        itemCount: categoryMeals.length,),
    );
  }

}
