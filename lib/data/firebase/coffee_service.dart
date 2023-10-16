
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_ecommerse/data/model/coffee_model.dart';
import 'package:coffee_ecommerse/data/model/order_model.dart';
import 'package:coffee_ecommerse/data/universal_data.dart';

class CoffeeService {
  Future<UniversalData> addProduct({required CoffeeModel coffeeModel}) async {
    try {
      DocumentReference newProduct = await FirebaseFirestore.instance
          .collection("coffee")
          .add(coffeeModel.toJson());

      print("         DocumentReference: $newProduct");

      await FirebaseFirestore.instance
          .collection("coffee")
          .doc(newProduct.id)
          .update({
        "id": newProduct.id,
      });

      return UniversalData(data: "Coffee added!");
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> addOrder({required OrderModel orderModel}) async {
    try {
      DocumentReference newProduct = await FirebaseFirestore.instance
          .collection("orders")
          .add(orderModel.toJson());

      print("         DocumentReference: $newProduct");

      await FirebaseFirestore.instance
          .collection("orders")
          .doc(newProduct.id)
          .update({
        "id": newProduct.id,
      });

      return UniversalData(data: "Order added!");
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> updateProduct(
      {required CoffeeModel coffeeModel}) async {
    try {
      await FirebaseFirestore.instance
          .collection("coffee")
          .doc(coffeeModel.id)
          .update(coffeeModel.toJson());

      return UniversalData(data: "Coffee updated!");
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> deleteProduct({required String productId}) async {
    try {
      await FirebaseFirestore.instance
          .collection("coffee")
          .doc(productId)
          .delete();

      return UniversalData(data: "Coffee deleted!");
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }
}