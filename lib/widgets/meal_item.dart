import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget{
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  //final Function removeItem;
  
  MealItem({
  @required this.id,
  @required this.affordability,
  @required this.complexity,
  @required this.title,
  @required this.duration,
  @required this.imageUrl,
  //@required this.removeItem,
  });

  String get complextyText {
    if (complexity == Complexity.Simple)
      return 'simple';
    if (complexity == Complexity.Challenging)
      return 'Challenging';
    if (complexity == Complexity.Hard)
      return 'hard';
  }
  String get affordabilityText{
   if (affordability == Affordability.Affordable)
     return 'affordable';
   if (affordability == Affordability.Luxurious)
     return 'luxurious';
   if (affordability == Affordability.Pricey)
     return 'pricey';
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetailScreen.routeNameMeal,
      arguments: id,
    ).then((result) {
      //if (result != null)
        //removeItem(result);
    }
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack( children:<Widget> [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)
                  ),
                  child: Image.network(imageUrl,height: 250,width: double.infinity,fit: BoxFit.cover,),
                ),
                Positioned(
                  bottom: 5,
                  left: 10,
                  child: Container(
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      color: Colors.black54,
                    ),
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                    child: Text(title,style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                    ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                Row(children: [
                  Icon(Icons.schedule,),
                  SizedBox(width: 6,),
                  Text('${duration} min'),
                ],),
                Row(children: [
                  Icon(Icons.work,),
                  SizedBox(width: 6,),
                  Text(complextyText),
                ],),
                Row(children: [
                  Icon(Icons.attach_money,),
                  SizedBox(width: 6,),
                  Text(affordabilityText),
                ],),
              ],),
            )
          ],
        ),
      ),
    );
  }
}