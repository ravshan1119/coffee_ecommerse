import 'package:coffee_ecommerse/components/category_card.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        scrollDirection: Axis.horizontal,
        children: [
          CategoryItem(
            iconData: 'assets/coffee-cup-coffee-svgrepo-com.svg',
            title: 'Cappacino',
            isSelected: true,
          ),
          CategoryItem(
            iconData: 'assets/coffee-svgrepo-com.svg',
            title: 'Coca cola',
            isSelected: false,
          ),
          CategoryItem(
            iconData: 'assets/coffee-svgrepo-com.svg',
            title: 'Expresso',
            isSelected: false,
          )
        ],
      ),
    );
  }
}
