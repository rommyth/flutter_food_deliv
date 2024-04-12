import 'package:flu_5_food_delivery/models/restaurant_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyReceipt extends StatelessWidget {
  const MyReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    final restaurant = context.read<Restaurant>();

    return Padding(
      padding: EdgeInsets.fromLTRB(25, 25, 25, 25),
      child: Center(
        child: Column(
          children: [
            const Text('Thank you for your order :))'),
            Container(
              margin: const EdgeInsets.only(top: 25),
              decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).colorScheme.secondary),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(25),
              child: Text(restaurant.displayCartReceipt()),
            ),
            const SizedBox(height: 25),
            const Text('Estimated delivery time is 4:10 AM'),
          ],
        ),
      ),
    );
  }
}
