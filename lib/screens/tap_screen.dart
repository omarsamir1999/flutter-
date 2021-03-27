import 'package:flutter/material.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/favourite_screen.dart';
import 'package:meal_app/widgets/mainDrawer.dart';
class TapScreen extends StatefulWidget {
  @override
  _TapScreenState createState() => _TapScreenState();
}

class _TapScreenState extends State<TapScreen> {
  final _pages=[
    {
    "pages" :CategoriesScreen(),
    "title" : "Categories"
    },
    {
      "pages" :FavouriteScreen(),
      "title" : "Your Favourite"
    },
  ];
  int selectPageIndex=0;
  void _selectPage(int value) {
    setState(() {
      selectPageIndex=value;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_pages[selectPageIndex]["title"]),
      ),
      body:(_pages[selectPageIndex]["pages"]),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor:Theme.of(context).accentColor ,
        unselectedItemColor: Colors.white,
        currentIndex: selectPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text("Categories"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text("Favorites"),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
