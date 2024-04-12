import 'package:flu_5_food_delivery/models/food_model.dart';
import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget {
  final TabController tabController;

  const MyTabBar({super.key, required this.tabController});

  List<Tab> _buildCategoryTabs() {
    return FoodCategory.values
        .map((category) => Tab(
              text: category.toString().split('.').last,
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
        tabs: _buildCategoryTabs(),
        controller: tabController,
      ),
    );
  }
}
