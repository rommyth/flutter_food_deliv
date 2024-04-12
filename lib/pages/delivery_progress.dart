import 'package:flu_5_food_delivery/widgets/my_receipt.dart';
import 'package:flutter/material.dart';

class DeliveryProgressPage extends StatelessWidget {
  const DeliveryProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delivery in progress...'),
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: BottomNavBar(),
      body: const Column(
        children: [
          MyReceipt(),
        ],
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          // profile pic
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.background,
            ),
            child: IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
          ),

          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mitch Koko',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              Text('Driver',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary)),
            ],
          ),

          const Spacer(),

          Row(
            children: [
              // chat button
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.chat,
                      color: Theme.of(context).colorScheme.primary,
                    )),
              ),
              const SizedBox(width: 10),

              // phone button
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.phone,
                      color: Colors.green,
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}
