import '../data/model/cat_model.dart';

class AppConstants{

  static final String USER_ID = 'uid';

  static List<CategoryModel> mCat = [
    CategoryModel(id: 1, name: "Shopping", imgPath: "asset/image/cat_img/hawaiian-shirt.png"),
    CategoryModel(id: 2, name: "Coffee", imgPath: "asset/image/cat_img/coffee.png"),
    CategoryModel(id: 3, name: "Petrol", imgPath: "asset/image/cat_img/vehicles.png"),
    CategoryModel(id: 4, name: "Recharge", imgPath: "asset/image/cat_img/smartphone.png"),
    CategoryModel(id: 5, name: "Restaurant", imgPath: "asset/image/cat_img/restaurant.png"),
  ];

}