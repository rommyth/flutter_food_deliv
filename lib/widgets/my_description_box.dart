import 'package:flutter/material.dart';

class MyDescriptionBox extends StatelessWidget {
  const MyDescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    // textstyle
    final TextStyle myPrimaryStyle =
        TextStyle(color: Theme.of(context).colorScheme.inversePrimary);
    final TextStyle mySecondaryStyle =
        TextStyle(color: Theme.of(context).colorScheme.primary);

    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.secondary),
          borderRadius: BorderRadius.circular(8)),
      padding: EdgeInsets.all(25),
      margin: EdgeInsets.fromLTRB(25, 0, 25, 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // delivery fee
          Column(
            children: [
              Text('\$0.90', style: myPrimaryStyle),
              Text('Delivery fee', style: mySecondaryStyle),
            ],
          ),

          //delivery time
          Column(
            children: [
              Text('15-40 min', style: myPrimaryStyle),
              Text('Delivery time', style: mySecondaryStyle),
            ],
          )
        ],
      ),
    );
  }
}
