import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_ecommerse/components/categories.dart';
import 'package:coffee_ecommerse/components/home_header.dart';
import 'package:coffee_ecommerse/components/product_card.dart';
import 'package:coffee_ecommerse/components/special_card.dart';
import 'package:coffee_ecommerse/views/client_orders_page.dart';
import 'package:coffee_ecommerse/views/product_details.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Stream<QuerySnapshot> coffeesStream =
      FirebaseFirestore.instance.collection('coffee').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: coffeesStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: Text("Error"),
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          return ListView(
            children: [
              Header(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AllProductScreen()));
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                child: Text(
                  'Good Morning, David ',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 24),
                ),
              ),
              const SearchBar(),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                child: Text(
                  'Categories',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
              ),
              const Categories(),
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...List.generate(
                      snapshot.data!.docs.length,
                      (index) => Padding(
                        padding: const EdgeInsets.all(20),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProducDetailsScreen(
                                            name: snapshot.data!.docs[index]
                                                ["name"],
                                            id: snapshot.data!.docs[index]["id"],
                                            description: snapshot.data!
                                                .docs[index]["description"],
                                            price: snapshot.data!.docs[index]
                                                ["price"],
                                          )));
                            },
                            child: ProductCard(
                              price: snapshot.data!.docs[index]["price"],
                              name: snapshot.data!.docs[index]["name"],
                              description: snapshot.data!.docs[index]
                                  ["description"],
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                child: Text(
                  'Special Offer',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                      fontSize: 24),
                ),
              ),
              const SpecialOfferCard()
            ],
          );
        },
      ),
    );
  }
}
