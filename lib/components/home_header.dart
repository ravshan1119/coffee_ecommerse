import 'package:coffee_ecommerse/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key, required this.onTap,
  }) : super(key: key);
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1640915550677-26ade06905fd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzN3x8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60'),
          ),
          const Row(
            children: [
              Icon(
                Icons.location_on_sharp,
                color: AppTheme.primaryColor,
              ),
              Text(
                'London, England',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          GestureDetector(
            onTap: onTap,
            child: SvgPicture.asset(
              'assets/bell-notification-svgrepo-com.svg',
              height: 32,
            ),
          ),
        ],
      ),
    );
  }
}
