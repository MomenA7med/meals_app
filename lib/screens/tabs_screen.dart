import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favorites_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget{
  List<Meal> favorite;
  TabsScreen(this.favorite);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen>{
  int _selecPageIndex = 0;
  void _selectPage(int index){
    setState(() {
      _selecPageIndex = index;
    });
  }
  List<Map<String,Object>> _pages ;

  @override
  void initState() {
    _pages =
    [
      {'page' : CategoriesScreen(), 'title': 'Categories'},
      {'page' : FavoritesScreen(widget.favorite), 'title': 'My Favorites'},
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selecPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selecPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selecPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
            backgroundColor: Theme.of(context).primaryColor,
    )
        ],
      ),
    );
    // TabBar in Top
    // return DefaultTabController(
    //   length: 2,
    //   child: Scaffold(
    //   appBar: AppBar(
    //     toolbarHeight: 80,
    //     //title: Text('Meals'),
    //     bottom: TabBar(
    //       tabs: [
    //         Tab(
    //           icon: Icon(Icons.category),
    //           text: 'Categories',
    //         ),
    //         Tab(
    //           icon: Icon(Icons.star),
    //           text: 'Favorites',),
    //       ],
    //     ),
    //   ),
    //     body: TabBarView(children: [
    //       CategoriesScreen(),
    //       FavoritesScreen(),
    //     ]),
    //   ),
    // );
  }

}