import 'package:collection/collection.dart';
import 'package:flu_5_food_delivery/models/cart_item_model.dart';
import 'package:flu_5_food_delivery/models/food_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Restaurant extends ChangeNotifier {
  final List<Food> _menu = [
    //burgers
    Food(
      name: 'Classic Burger',
      description: 'Classic Burger with special Italian sauce',
      imagePath: 'lib/images/burgers/original_burger.jpg',
      price: 0.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: 'Extra Cheese', price: 0.99),
        Addon(name: 'Meat', price: 1.99),
        Addon(name: 'Salad', price: 0.49),
      ],
    ),
    Food(
      name: 'Deluxe Burger',
      description: 'Deluxe Burger with savory Italian sauce',
      imagePath: 'lib/images/burgers/burger_speciality_cheese.jpg',
      price: 1.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: 'Extra Cheese', price: 1.99),
        Addon(name: 'Meat', price: 2.99),
        Addon(name: 'Salad', price: 1.49),
      ],
    ),
    Food(
      name: 'Gourmet Burger',
      description: 'Gourmet Burger with authentic Italian sauce',
      imagePath: 'lib/images/burgers/chiken_burger_combo.jpg',
      price: 2.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: 'Extra Cheese', price: 2.99),
        Addon(name: 'Meat', price: 3.99),
        Addon(name: 'Salad', price: 2.49),
      ],
    ),
    Food(
      name: 'Signature Burger',
      description: 'Signature Burger with rich Italian sauce',
      imagePath: 'lib/images/burgers/diet_burger.jpg',
      price: 3.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: 'Extra Cheese', price: 3.99),
        Addon(name: 'Meat', price: 4.99),
        Addon(name: 'Salad', price: 3.49),
      ],
    ),
    Food(
      name: 'Supreme Burger',
      description: 'Supreme Burger with classic Italian sauce',
      imagePath: 'lib/images/burgers/black_burger.jpg',
      price: 4.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: 'Extra Cheese', price: 4.99),
        Addon(name: 'Meat', price: 5.99),
        Addon(name: 'Salad', price: 4.49),
      ],
    ),

    // desserts
    Food(
      name: 'Chocolate Lava Cake',
      description: 'Decadent chocolate cake with a molten center',
      imagePath: 'lib/images/desserts/chocolate_lava_cake.jpeg',
      price: 4.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: 'Vanilla Ice Cream', price: 1.99),
        Addon(name: 'Whipped Cream', price: 0.99),
        Addon(name: 'Fresh Berries', price: 2.49),
      ],
    ),
    Food(
      name: 'Tiramisu',
      description:
          'Classic Italian dessert made with layers of coffee-soaked ladyfingers and mascarpone cheese',
      imagePath: 'lib/images/desserts/tiramisu_cake.jpeg',
      price: 3.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: 'Cocoa Powder', price: 0.49),
        Addon(name: 'Amaretto Syrup', price: 1.49),
        Addon(name: 'Chocolate Shavings', price: 1.99),
      ],
    ),
    Food(
      name: 'New York Strawberry',
      description: 'Creamy strawberry cake with a graham cracker crust',
      imagePath: 'lib/images/desserts/strawberry-tart.jpeg',
      price: 5.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: 'Strawberry Sauce', price: 1.49),
        Addon(name: 'Caramel Drizzle', price: 1.99),
        Addon(name: 'Blueberry Compote', price: 1.99),
      ],
    ),
    Food(
      name: 'Macaron',
      description: 'Classic macaron with a flaky crust',
      imagePath: 'lib/images/desserts/macaron.jpeg',
      price: 4.49,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: 'Vanilla Bean Ice Cream', price: 2.49),
        Addon(name: 'Cinnamon Sugar Dusting', price: 0.99),
        Addon(name: 'Whipped Cream', price: 0.99),
      ],
    ),
    Food(
      name: 'Oreo Chocolate Lava Cake',
      description: 'Warm chocolate cake with a gooey orep center',
      imagePath: 'lib/images/desserts/oreo-sweety.jpeg',
      price: 5.49,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: 'Vanilla Ice Cream', price: 1.99),
        Addon(name: 'Caramel Drizzle', price: 1.49),
        Addon(name: 'Fresh Berries', price: 2.49),
      ],
    ),

    // drinks
    Food(
      name: 'Black Coffee',
      description: 'Strong brewed coffee without milk or cream',
      imagePath:
          'lib/images/drinks/black_coffee.jpg', // You can add the appropriate image path
      price: 2.49, // Adjust the price accordingly
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'Sugar', price: 0.49),
        Addon(name: 'Caramel Syrup', price: 0.99),
        Addon(name: 'Vanilla Extract', price: 0.99),
      ],
    ),
    Food(
      name: 'Coffee Latte',
      description:
          'Espresso-based coffee drink with steamed milk and a small amount of foam',
      imagePath:
          'lib/images/drinks/coffee_latte.jpg', // You can add the appropriate image path
      price: 3.49, // Adjust the price accordingly
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'Caramel Drizzle', price: 0.99),
        Addon(name: 'Vanilla Syrup', price: 0.99),
        Addon(name: 'Whipped Cream', price: 0.99),
      ],
    ),
    Food(
      name: 'Lemon Squash',
      description: 'Refreshing drink made with lemon juice, sugar, and water',
      imagePath:
          'lib/images/drinks/lemon_squash.jpg', // You can add the appropriate image path
      price: 2.99, // Adjust the price accordingly
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'Mint Leaves', price: 0.49),
        Addon(name: 'Lemon Wedge', price: 0.49),
        Addon(name: 'Soda Water', price: 0.99),
      ],
    ),
    Food(
      name: 'Lemon Tea',
      description: 'Tea brewed with lemon slices, sugar, and sometimes spices',
      imagePath:
          'lib/images/drinks/lemon_tea.jpg', // You can add the appropriate image path
      price: 2.99, // Adjust the price accordingly
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'Honey', price: 0.49),
        Addon(name: 'Cinnamon Stick', price: 0.49),
        Addon(name: 'Ginger Slices', price: 0.99),
      ],
    ),

    // salads
    Food(
      name: 'Avocado Salad',
      description:
          'Fresh salad made with avocado, mixed greens, and balsamic vinaigrette',
      imagePath: 'lib/images/salads/avocado.jpg',
      price: 4.99, // Adjust the price accordingly
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: 'Grilled Chicken', price: 2.99),
        Addon(name: 'Feta Cheese', price: 1.49),
        Addon(name: 'Toasted Almonds', price: 0.99),
      ],
    ),
    Food(
      name: 'Banana Salad',
      description:
          'Refreshing salad made with sliced bananas, mixed greens, and citrus dressing',
      imagePath:
          'lib/images/salads/banana.jpg', // You can add the appropriate image path
      price: 3.99, // Adjust the price accordingly
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: 'Walnuts', price: 1.49),
        Addon(name: 'Blueberries', price: 1.99),
        Addon(name: 'Greek Yogurt', price: 0.99),
      ],
    ),
    Food(
      name: 'Cherry Salad',
      description:
          'Delicious salad made with fresh cherries, mixed greens, and honey balsamic dressing',
      imagePath:
          'lib/images/salads/cherry.jpg', // You can add the appropriate image path
      price: 5.49, // Adjust the price accordingly
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: 'Goat Cheese', price: 2.49),
        Addon(name: 'Pecans', price: 1.99),
        Addon(name: 'Dried Cranberries', price: 1.49),
      ],
    ),
    Food(
      name: 'Orange Salad',
      description:
          'Zesty salad made with fresh oranges, mixed greens, and citrus vinaigrette',
      imagePath:
          'lib/images/salads/oranges.jpg', // You can add the appropriate image path
      price: 4.49, // Adjust the price accordingly
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: 'Shrimp', price: 3.49),
        Addon(name: 'Avocado Slices', price: 1.99),
        Addon(name: 'Pistachios', price: 1.49),
      ],
    ),

    // sides
    Food(
      name: 'Dadu Steak',
      description: 'Tender cubes of steak seasoned and grilled to perfection',
      imagePath:
          'lib/images/sides/dadu_steak.jpeg', // You can add the appropriate image path
      price: 6.99, // Adjust the price accordingly
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: 'Garlic Butter', price: 1.99),
        Addon(name: 'Mushroom Sauce', price: 2.49),
        Addon(name: 'Grilled Vegetables', price: 1.99),
      ],
    ),
    Food(
      name: 'Nuggets',
      description:
          'Crispy chicken nuggets served with your choice of dipping sauce',
      imagePath:
          'lib/images/sides/nugget.jpeg', // You can add the appropriate image path
      price: 3.99, // Adjust the price accordingly
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: 'BBQ Sauce', price: 0.49),
        Addon(name: 'Honey Mustard', price: 0.49),
        Addon(name: 'Ranch Dressing', price: 0.49),
      ],
    ),
    Food(
      name: 'Silantro Lime Rice',
      description:
          'Fluffy white rice flavored with fresh silantro and zesty lime',
      imagePath:
          'lib/images/sides/silantro_lime_rice.jpeg', // You can add the appropriate image path
      price: 2.49, // Adjust the price accordingly
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: 'Black Beans', price: 0.99),
        Addon(name: 'Grilled Corn', price: 0.99),
        Addon(name: 'Sour Cream', price: 0.49),
      ],
    ),
  ];

  /* 

   G E T T E R S

  */

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;

  /* 

    O P E R T I O N S

  */

  // user cart
  final List<CartItem> _cart = [];

  // add to the cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    // check is there same food
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      bool isSameFood = item.food == food;

      bool isSameAddons =
          ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
    });

    // cek if there is exist
    if (cartItem != null) {
      cartItem.quantity++;
    }
    // if not add new
    else {
      _cart.add(CartItem(food: food, selectedAddons: selectedAddons));
    }

    notifyListeners();
  }

  // remove from the cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  // get total prcie from the cart
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }

      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

  // get total numbers of item in cart
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }

    return totalItemCount;
  }

  // clear the cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  /* 

   H E L P E R S

  */

  // generate a receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt");
    receipt.writeln();

    // format the date to inlcude up to seconds only
    String formatToDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    receipt.writeln(formatToDate);
    receipt.writeln();
    receipt.writeln('--------------');

    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln('Addon : ${_formatAddons(cartItem.selectedAddons)}');
      }
      receipt.writeln();
    }

    receipt.writeln('--------------');
    receipt.writeln();
    receipt.writeln('Total Items : ${getTotalItemCount()}');
    receipt.writeln('Total Price : ${_formatPrice(getTotalPrice())}');

    return receipt.toString();
  }

  // format double value into money
  String _formatPrice(double price) {
    return "\$" + price.toStringAsFixed(2);
  }

  // format list of addons into a string summary
  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
        .join(', ');
  }
}
