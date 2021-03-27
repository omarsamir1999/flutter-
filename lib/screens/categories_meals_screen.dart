import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';
class CategoryMealsScreen extends StatefulWidget {


  static const routeName="Category_meals";
  final List<Meal> availableMeal;

  CategoryMealsScreen(this.availableMeal);

  @override
  _CategoriesMealsScreenState createState() => _CategoriesMealsScreenState();
}

class _CategoriesMealsScreenState extends State<CategoryMealsScreen> {
  String  categoryTitle;
  List<Meal> displayedMeal;
  @override
  void didChangeDependencies() {
    final routeArg= ModalRoute.of(context).settings.arguments as Map<String,String>;
    final categoryId =routeArg["id"];
    categoryTitle =routeArg["title"];
    displayedMeal=widget.availableMeal.where((meal) =>
        meal.categories.contains(categoryId)
    ).toList();
    super.didChangeDependencies();
  }

  void removeMeal(String mealId) {
    setState(() {
      displayedMeal.removeWhere((meal) => meal.id==mealId);
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle),
      ),
      body:ListView.builder(
        itemBuilder:(ctx, index) {
          return MealItem(
            id: displayedMeal[index].id,
            title: displayedMeal[index].title,
            imageUrl: displayedMeal[index].imageUrl,
            duration: displayedMeal[index].duration,
            affordability: displayedMeal[index].affordability,
            complexity: displayedMeal[index].complexity,
            removeItem: removeMeal,
          );
        },
        itemCount: displayedMeal.length,
      ),
    );
  }

}
