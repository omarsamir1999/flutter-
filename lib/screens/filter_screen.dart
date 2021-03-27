import 'package:flutter/material.dart';
import 'package:meal_app/widgets/mainDrawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = "/filter";
  final Function saveFilters;
  final Map<String,bool> _currentFilters;

  FilterScreen(this._currentFilters,this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  @override
  initState(){
     _glutenFree = widget._currentFilters["GlutenFree"];
     _lactoseFree = widget._currentFilters["LactoseFree"];
     _vegan = widget._currentFilters["Vegan"];
     _vegetarian = widget._currentFilters["Vegetarian"];
    super.initState();
  }
  Widget _filterSwitched(String title, bool values, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: values,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed:(){
              final  Map<String, bool> _selectedFilters={
                "GlutenFree": _glutenFree,
                "LactoseFree": _lactoseFree,
                "Vegan": _vegan,
                "Vegetarian": _vegetarian,
              };
              widget.saveFilters(_selectedFilters);
              }


          ),
        ],
        title: Text("Your Filters"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust Your Meal Selection",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _filterSwitched("Gluten-Free", _glutenFree, (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                _filterSwitched("Lactose-Free", _lactoseFree, (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
                _filterSwitched("vegetarian", _vegetarian, (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
                _filterSwitched("vegan", _vegan, (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
