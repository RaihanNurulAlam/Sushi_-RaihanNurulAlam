import 'package:flutter/cupertino.dart';
import 'package:flutter_latihan/models/cart_model.dart';
import 'package:flutter_latihan/models/food.dart';

class Cart extends ChangeNotifier {
  final List<CartModel> _cart = [];

  List<CartModel> get cart => _cart;

  void addToCart(Food foodItem, int qty) {
    _cart.add(
      CartModel(
        name: foodItem.name,
        price: foodItem.price,
        imagePath: foodItem.imagePath,
        quantity: qty.toString(),
      ),
    );
    notifyListeners();
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  void deleteItemCart(CartModel item) {
    _cart.remove(item);
    notifyListeners();
  }
}
