import 'package:coffee_ecommerse/components/category_card.dart';
import 'package:coffee_ecommerse/theme.dart';
import 'package:flutter/material.dart';

class AddToCartCard extends StatelessWidget {
  const AddToCartCard({
    Key? key, required this.onTap, required this.price,
  }) : super(key: key);

  final VoidCallback onTap;
  final double price;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 30, right: 30),
        alignment: Alignment.center,
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppTheme.primaryColor,
            borderRadius: BorderRadius.circular(30)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Add to cart     ',
                style: TextStyle(
                    color: AppTheme.whiteColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 18)),
            const SizedBox(
                height: 20,
                child: VerticalDivider(
                  color: Colors.white,
                )),
            Text('    \$ $price',
                style: const TextStyle(
                    color: AppTheme.whiteColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

class SizeListSection extends StatelessWidget {
  const SizeListSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.only(
        left: 20.0,
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child:
                CategoryItem(isSelected: true, iconData: null, title: "Small"),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: CategoryItem(
                isSelected: false, iconData: null, title: "Medium"),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child:
                CategoryItem(isSelected: false, iconData: null, title: "Large"),
          ),
        ],
      ),
    );
  }
}
