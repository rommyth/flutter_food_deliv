import 'package:flu_5_food_delivery/models/food_model.dart';

class CartItem {
  Food food;
  List<Addon> selectedAddons;
  int quantity;

  CartItem({
    required this.food,
    required this.selectedAddons,
    this.quantity = 1,
  });

  double get totalPrice {
    double addonsPrice = selectedAddons.fold(0, (a, b) => a + b.price);
    return (food.price + addonsPrice) * quantity;
  }
}
