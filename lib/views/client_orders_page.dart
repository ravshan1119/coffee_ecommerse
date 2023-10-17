import 'package:coffee_ecommerse/data/firebase/coffee_service.dart';
import 'package:coffee_ecommerse/data/local_db/local_db.dart';
import 'package:coffee_ecommerse/data/model/client_order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class AllProductScreen extends StatefulWidget {
  const AllProductScreen({super.key});

  @override
  State<AllProductScreen> createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {
  List<ClientOrderModel> allProducts = [];
  bool isLoading = false;

  init() async {
    setState(() {
      isLoading = true;
    });
    allProducts = await LocalDatabase.getAllTodos();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          backgroundColor: Colors.white,
          title: const Text("Orders"),
        ),
        body: !isLoading
            ? ListView(
                children: [
                  ...List.generate(
                    allProducts.length,
                    (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Slidable(
                        startActionPane:
                            ActionPane(motion: const BehindMotion(), children: [
                          SlidableAction(
                            onPressed: (context) {
                              LocalDatabase.deleteTodo(allProducts[index].id!);

                              CoffeeService().deleteOrder(
                                  productId: allProducts[index].firebaseId);
                              init();

                              setState(() {});
                            },
                            backgroundColor: Colors.red,
                            icon: Icons.delete,
                            label: "delete",
                          )
                        ]),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.green),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: ListTile(
                              title: Text(
                                allProducts[index].productName,
                                style: const TextStyle(color: Colors.black),
                              ),
                              trailing: Text(
                                allProducts[index].count.toString(),
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }
}
