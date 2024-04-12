import 'package:flu_5_food_delivery/models/restaurant_model.dart';
import 'package:flu_5_food_delivery/pages/payment_page.dart';
import 'package:flu_5_food_delivery/widgets/my_button.dart';
import 'package:flu_5_food_delivery/widgets/my_cart_tile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userCart = context.watch<Restaurant>().cart;
    final restaurant = context.read<Restaurant>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Theme.of(context).colorScheme.background,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Clear Cart'),
                    content: const Text('Are you sure wnat to clear cart?'),
                    actions: [
                      MaterialButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cancel'),
                      ),
                      MaterialButton(
                        onPressed: () {
                          restaurant.clearCart();
                          Navigator.pop(context);
                        },
                        child: const Text('Accept'),
                      ),
                    ],
                  );
                },
              );
            },
          )
        ],
      ),
      body: Column(
        children: [
          userCart.isEmpty
              ? Expanded(
                  child: Center(child: const Text('Cart is Empty')),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: userCart.length,
                    itemBuilder: (context, index) {
                      // get individual cartItem
                      final cartItem = userCart[index];

                      // render indivirual cartItem
                      return MyCartTile(cartItem: cartItem);
                    },
                  ),
                ),
          MyButton(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PaymentPage()));
              },
              text: 'Go to checkout'),
          const SizedBox(height: 25)
        ],
      ),
    );
  }
}
