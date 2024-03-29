import 'package:coffee_ecommerse/theme.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {Key? key,
      required this.name,
      required this.description,
      required this.price})
      : super(key: key);
  final String name;
  final String description;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 8,
            offset: const Offset(3, 5),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      width: MediaQuery.of(context).size.width / 2 - 24,
      padding: const EdgeInsets.all(4),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(4),
                height: MediaQuery.of(context).size.width / 2 - 48,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://media.istockphoto.com/photos/cup-of-cafe-latte-with-coffee-beans-and-cinnamon-sticks-picture-id505168330?b=1&k=20&m=505168330&s=170667a&w=0&h=jJTePtpYZLR3M2OULX5yoARW7deTuAUlwpAoS4OriJg='))),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 4),
                child: Text(
                  name,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '\$${price.toString()}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w900),
                ),
              ),
            ],
          ),
          const Positioned(
              bottom: 8,
              right: 8,
              child: CircleAvatar(
                  backgroundColor: AppTheme.primaryColor,
                  child: Icon(Icons.add))),
          Positioned(
              top: 14,
              right: 14,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppTheme.secondaryColor.withOpacity(.8),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.star, color: Colors.white),
                    Text(
                      '4,5',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
