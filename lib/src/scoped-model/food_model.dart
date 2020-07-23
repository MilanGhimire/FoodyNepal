import 'dart:convert';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

// model
import '../../src/models/food_model.dart';

class FoodModel extends Model{
  List<Food> _foods = [];

  List<Food> get foods{
    return List.from(_foods);
  }

  void addFood(Food food) {
    _foods.add(food);
  }
  
  void fetchFoods() {
    http.get("http://192.168.0.101/flutter_food_app/api/foods/getFoods.php")
        .then((http.Response response) {
      print(response.body);
      final List fetchData = json.decode(response.body);
      final List<Food> fetchedFoodItem = [];
      fetchData.forEach((element) {
        Food food = Food(
          id: element["id"],
          category: element["category_id"],
          discount: double.parse(element["discount"]),
          imagePath: element["image_path"],
          name: element["title"],
          price: double.parse(element["price"]),
        );
        fetchedFoodItem.add(food);
      });

      _foods = fetchedFoodItem;
    });
  }
}