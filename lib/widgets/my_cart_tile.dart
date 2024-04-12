import 'package:flu_5_food_delivery/models/cart_item_model.dart';
import 'package:flu_5_food_delivery/models/restaurant_model.dart';
import 'package:flu_5_food_delivery/widgets/my_quantity_selector.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;
  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    final restaurant = context.read<Restaurant>();

    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            children: [
              // food image
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  cartItem.food.imagePath,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(width: 10),

              // name and price
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // food name
                    Text(
                      cartItem.food.name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),

                    // food price
                    Text(
                      '\$' + cartItem.food.price.toString(),
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ],
                ),
              ),

              // quantity selector
              QuantitySelector(
                quantity: cartItem.quantity,
                food: cartItem.food,
                onIncrement: () {
                  restaurant.addToCart(cartItem.food, cartItem.selectedAddons);
                },
                onDecrement: () {
                  restaurant.removeFromCart(cartItem);
                },
              )
            ],
          ),
          SizedBox(
            height: cartItem.selectedAddons.isEmpty ? 0 : 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: cartItem.selectedAddons
                  .map((addon) => Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: FilterChip(
                          label: Row(
                            children: [
                              // addon name
                              Text(addon.name),

                              // addon price
                              Text(' (\$${addon.price.toString()})'),
                            ],
                          ),
                          onSelected: (e) {},
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          labelStyle: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              fontSize: 12),
                          shape: StadiumBorder(
                              side: BorderSide(
                                  color:
                                      Theme.of(context).colorScheme.primary)),
                        ),
                      ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
