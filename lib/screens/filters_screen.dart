import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget{
  static final filterRoute = '/filter';
  final Function saveFilter;
  final Map<String,bool> currentFilters;

  FiltersScreen(this.currentFilters,this.saveFilter);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;


  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters Screen'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: (){
                final selectedFilters = {
                  'gluten' : _glutenFree,
                  'lactose' : _lactoseFree,
                  'vegan' : _vegan,
                  'vegetarian' : _vegetarian,
                };
                widget.saveFilter(selectedFilters);
              },
          ),
        ],),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Adjust Your Meal Screen ',style: Theme.of(context).textTheme.headline6,),
          ),
          Expanded(
            child: ListView(children: [
              SwitchListTile(title: Text('Gluten-free'),
                  value: _glutenFree,
                  subtitle: Text('only include gluten-free meals'),
                  onChanged:(newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              }),
              SwitchListTile(title: Text('Vegetarian'),
                  value: _vegetarian,
                  subtitle: Text('only include vegetarian meals'),
                  onChanged:(newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  }),
              SwitchListTile(title: Text('Vegan'),
                  value: _vegan,
                  subtitle: Text('only include vegan meals'),
                  onChanged:(newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  }),
              SwitchListTile(title: Text('Lactose-free'),
                  value: _lactoseFree,
                  subtitle: Text('only include lactose-free meals'),
                  onChanged:(newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  }),
            ],),
          )
        ],
      ),
    );
  }
}