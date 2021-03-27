import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/categories_meals_screen.dart';
import 'package:meal_app/screens/filter_screen.dart';
import 'package:meal_app/screens/meal_deatil_screen.dart';
import 'package:meal_app/screens/tap_screen.dart';

void main()=> runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "GlutenFree": false,
    "LactoseFree": false,
    "Vegan": false,
    "Vegetarian": false,
  };
  List<Meal> _availableMeal =DUMMY_MEALS;
  void _setFilters(Map<String, bool> _filtersData) {
    setState(() {
      _filters=_filtersData;
      _availableMeal =DUMMY_MEALS.where((meal)  {
        if(_filters ["GlutenFree"] && !meal.isGlutenFree){
          return false;
        }
        if(_filters ["LactoseFree"] && !meal.isLactoseFree){
          return false;
        }
        if(_filters ["Vegan"] && !meal.isVegan){
          return false;
        }

        if(_filters ["Vegetarian"] && !meal.isVegetarian){
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1),
              ),
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1),
              ),
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ))),
      // home: MyHomePage(),
      routes: {
        "/": (context) => TapScreen(),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(_availableMeal),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
        FilterScreen.routeName: (context) => FilterScreen(_filters,_setFilters),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meal App"),
      ),
      body: null,
    );
  }
}
