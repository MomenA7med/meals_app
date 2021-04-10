import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget{

  Widget buildListTile(String title,IconData icon,Function tabHandler){
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tabHandler,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column( children: [
        Container(
          height: 120,
          width: double.infinity,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(20),
          color: Theme.of(context).accentColor,
          child: Text(
            'Cooking up !',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        SizedBox(height: 20,),
        buildListTile('Meals',Icons.restaurant,(){
          Navigator.of(context).pushReplacementNamed('/');
        }),
        Divider(
          height: 5,
          color: Colors.black,
        ),
        buildListTile('Filters',Icons.settings,(){
          Navigator.of(context).pushReplacementNamed(FiltersScreen.filterRoute);
        }),
      ],
      ),
    );
  }
  
}