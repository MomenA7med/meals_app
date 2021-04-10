import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';
import 'file:///D:/new/NanodegreeProjects/flutter_projects/meals_app/lib/screens/category_meals_screen.dart';

import 'models/meal.dart';
import 'screens/categories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool> _filters = {
    'gluten' : false,
    'lactose' : false,
    'vegan' : false,
    'vegetarian' : false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMail = [];
  void _setFilters (Map<String , bool> filterData){
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree)
          return false;
        if (_filters['lactose'] && !meal.isLactoseFree)
          return false;
        if (_filters['vegan'] && !meal.isVegan)
          return false;
        if (_filters['vegetarian'] && !meal.isVegetarian)
          return false;
        return true;
      }).toList();
    });
  }

  void _toggleFavorite (String mId){
    final existingIndex = _favoriteMail.indexWhere((meal) => meal.id == mId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMail.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMail.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mId));
      });
    }
  }

  bool isFavorite (String mId){
    return _favoriteMail.any((element) => element.id == mId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1.0),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          bodyText2: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          headline6: TextStyle(
            fontSize: 24,
            fontFamily: 'Robotocondensed',
            fontWeight: FontWeight.bold,
          ),
        )
      ),
      routes: {
        '/' : (ctx) => TabsScreen(_favoriteMail),
        CategoryMealsScreen.routeName : (ctx) => CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeNameMeal : (ctx) => MealDetailScreen(_toggleFavorite , isFavorite),
        FiltersScreen.filterRoute : (ctx) => FiltersScreen(_filters,_setFilters),
      },
      onGenerateRoute: (setting){
        print(setting.arguments);
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Text('Navigation Time!'),
      ),
    );
  }
}
