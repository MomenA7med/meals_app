import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  GridView(
        padding: const EdgeInsets.all(15),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        childAspectRatio: 3/2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 20,
        maxCrossAxisExtent: 200
      ),
      children: DUMMY_CATEGORIES.map((catData) => CategoryItem(
        catData.id,
        catData.title,
        catData.color,
      )).toList()
    );
  }
  
}