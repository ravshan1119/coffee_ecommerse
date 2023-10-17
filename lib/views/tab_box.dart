import 'package:coffee_ecommerse/theme.dart';
import 'package:coffee_ecommerse/views/coffee_add/coffee_add_page.dart';
import 'package:coffee_ecommerse/views/home_screen.dart';
import 'package:coffee_ecommerse/views/orders_page/order_page.dart';
import 'package:coffee_ecommerse/views/products/products_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> screens = <Widget>[
    const HomeScreen(),
    const OrdersPage(),
    const ProductsPage(),
    const CoffeeAddPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppTheme.primaryColor,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/home-svgrepo-com.svg',
                color: AppTheme.primaryColor,
                height: 28,
              ),
              label: 'Home'),
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.reorder_sharp,
                size: 28,
              ),
              label: 'Orders'),
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.production_quantity_limits,
                size: 28,
              ),
              label: 'Products'),
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.add,
                size: 28,
              ),
              label: 'Add Product'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: screens,
      ),
    );
  }
}
