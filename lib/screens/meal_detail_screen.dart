import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget{

  static final routeNameMeal = '/detail-mail';

  final Function toggleFavorite;
  final Function isFavorite;

  MealDetailScreen(this.toggleFavorite,this.isFavorite);

  Widget buildContainer(Widget child){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: child,
    );
  }
  Widget buildSectionTitle(BuildContext context,String text){
    return Container(
      margin: EdgeInsets.all(10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    String id = ModalRoute.of(context).settings.arguments as String;
    final selctedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == id);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selctedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(selctedMeal.imageUrl,
            fit: BoxFit.cover,),
          ),
          buildSectionTitle(context, 'Ingredients'),
          buildContainer(ListView.builder(itemBuilder: (ctx,index) => Card(
            color: Theme.of(context).accentColor,

            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
              child: Text(
                selctedMeal.ingredients[index],
              ),
            ),
          ),
            itemCount: selctedMeal.ingredients.length,
          )
        ),
          buildSectionTitle(context, 'Steps'),
          buildContainer(ListView.builder(
            itemBuilder: (ctx,index) => Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    child: Text('#${index+1}'),
                  ),
                  title: Text(selctedMeal.steps[index]),
                ),
                Divider(),
              ],
            ),
            itemCount: selctedMeal.steps.length,
          ))
        ],
    ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
            //Icons.delete
          isFavorite(id) ? Icons.star : Icons.star_border,
        ),
        onPressed: () => toggleFavorite(id),
        // () {
        //   //Navigator.of(context).pop(id);
        //   toggleFsvorite,
        // },
      ),
    );
  }
}