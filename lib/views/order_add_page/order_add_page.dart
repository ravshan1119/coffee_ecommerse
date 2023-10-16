import 'dart:io';
import 'package:coffee_ecommerse/cubits/coffee_add/coffee_add_cubit.dart';
import 'package:coffee_ecommerse/data/firebase/coffee_service.dart';
import 'package:coffee_ecommerse/data/model/order_model.dart';
import 'package:coffee_ecommerse/data/universal_data.dart';
import 'package:coffee_ecommerse/utils/loading_dialog.dart';
import 'package:coffee_ecommerse/views/coffee_add/widgets/global_button.dart';
import 'package:coffee_ecommerse/views/coffee_add/widgets/global_input.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class OrderAddPage extends StatefulWidget {
  const OrderAddPage({super.key});

  @override
  State<OrderAddPage> createState() => _OrderAddPageState();
}

class _OrderAddPageState extends State<OrderAddPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  CoffeeService coffeeService = CoffeeService();

  ImagePicker pickerOne = ImagePicker();

  File? _photo;

  var storage = FirebaseStorage.instance;

  @override
  void initState() {
    super.initState();
    _photo != null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoffeeAddCubit, CoffeeAddState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text("Order Add"),
          ),
          body: Stack(
            children: [
              ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GlobalTextField(
                      hintText: "Name",
                      controller: nameController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GlobalTextField(
                      hintText: "Number",
                      controller: numberController,
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GlobalTextField(
                      hintText: "Location",
                      controller: locationController,
                      maxLines: 5,
                    ),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GlobalButton(
                    title: "Add",
                    onTap: () async {
                      if (nameController.text.isNotEmpty &&
                          numberController.text.isNotEmpty &&
                          locationController.text.isNotEmpty) {
                        OrderModel orderModel = OrderModel(
                          id: "",
                          name: nameController.text,
                          number: numberController.text,
                          location: locationController.text,
                        );

                        showLoading(context: context);
                        UniversalData universalData = await coffeeService
                            .addOrder(orderModel: orderModel);
                        if (context.mounted) {
                          hideLoading(dialogContext: context);
                        }
                        if (universalData.error.isEmpty && context.mounted) {
                          var snackBar = SnackBar(
                            content: Text(universalData.data.toString()),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else {
                          var snackBar = SnackBar(
                            content: Text(universalData.error.toString()),
                          );
                          if (context.mounted) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        }
                      } else {
                        const snackBar = SnackBar(
                          content: Text('The field is not full!'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    color: Colors.greenAccent.shade200,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
