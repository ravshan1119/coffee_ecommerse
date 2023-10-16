import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_ecommerse/data/firebase/coffee_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('coffee').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
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
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Slidable(
                  startActionPane:
                      ActionPane(motion: const BehindMotion(), children: [
                    SlidableAction(
                      onPressed: (context) {
                        CoffeeService().deleteProduct(productId: data["id"]);
                      },
                      backgroundColor: Colors.red,
                      icon: Icons.delete,
                      label: "delete",
                    )
                  ]),
                  child: ListTile(
                    title: Text(data['name']),
                    subtitle: Text(data['description']),
                    trailing: Text(data["price"].toString()),
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
