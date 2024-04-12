import 'package:flu_5_food_delivery/models/cart_item_model.dart';
import 'package:flu_5_food_delivery/models/food_model.dart';
import 'package:flu_5_food_delivery/models/restaurant_model.dart';
import 'package:flu_5_food_delivery/widgets/my_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddons = {};

  FoodPage({super.key, required this.food}) {
    for (Addon addon in food.availableAddons) {
      selectedAddons[addon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  void addToCart(Food food, Map<Addon, bool> selectedAddons) {
    List<Addon> currentlySelectedAddons = [];
    for (Addon addon in widget.food.availableAddons) {
      if (widget.selectedAddons[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }

    context.read<Restaurant>().addToCart(food, currentlySelectedAddons);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                // food image
                Image.asset(widget.food.imagePath),

                // Use Expanded here to allow ListView to take up remaining space
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // food name
                      Text(
                        widget.food.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),

                      // food price
                      Text(
                        '\$' + widget.food.price.toString(),
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.primary),
                      ),

                      const SizedBox(height: 10),

                      // food descirption
                      Text(widget.food.description),

                      const SizedBox(height: 10),

                      Divider(color: Theme.of(context).colorScheme.secondary),

                      const SizedBox(height: 10),
                      // addon
                      Text(
                        'Add ons',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),

                      const SizedBox(height: 10),

                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).colorScheme.secondary),
                            borderRadius: BorderRadius.circular(8)),
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: widget.food.availableAddons.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            Addon addon = widget.food.availableAddons[index];
                            return CheckboxListTile(
                                value: widget.selectedAddons[addon],
                                onChanged: (value) {
                                  setState(() {
                                    widget.selectedAddons[addon] = value!;
                                  });
                                },
                                title: Text(addon.name),
                                subtitle: Text(
                                  '\$${addon.price.toString()}',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                ));
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                // button -> add to cart
                MyButton(
                    onTap: () => addToCart(widget.food, widget.selectedAddons),
                    text: 'Add to Cart'),

                const SizedBox(height: 25)
              ],
            ),
          ),
        ),
        SafeArea(
          child: Container(
            margin: const EdgeInsets.only(left: 25),
            decoration: BoxDecoration(
                // color: Theme.of(context).colorScheme.secondary,
                shape: BoxShape.circle),
            child: IconButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.white)),
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.chevron_left_rounded)),
          ),
        ),
      ],
    );
  }
}
