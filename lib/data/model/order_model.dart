import 'package:flutter/material.dart';

class OrderModel {
  String id;
  String name;
  String number;
  String location;
  String coffeeName;
  String coffeePrice;

  OrderModel(
      {
        required this.id,
        required this.name,
        required this.number,
        required this.location,
        required this.coffeeName,
        required this.coffeePrice,
      });

  @override
  String toString() {
    return 'FoodDetail(title: $name, location: $location, number: $number, id: $id';
  }

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    id: json["id"] as String? ?? "",
    name: json['title'] as String? ?? "",
    location: json['location'] as String? ?? "",
    number: json["number"] as String? ?? "",
    coffeeName: json["coffee_name"] as String? ?? "",
    coffeePrice: json["coffee_price"] as String? ?? "",
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'number': number,
    'location': location,
    'coffee_price': coffeePrice,
    'coffee_name': coffeeName,
  };

  OrderModel copyWith({
    String? id,
    String? name,
    String? number,
    String? location,
    String? coffeeName,
    String? coffeePrice,
  }) {
    return OrderModel(
      id: id ?? this.id,
      name: name ?? this.name,
      number: number ?? this.number,
      location: location ?? this.location,
      coffeeName: coffeeName ?? this.coffeeName,
      coffeePrice: coffeePrice ?? this.coffeePrice,
    );
  }
}

class Attribute {
  final Icon icon;
  final String title;

  Attribute({required this.icon, required this.title});
}
