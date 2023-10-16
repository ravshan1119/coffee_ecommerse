import 'package:flutter/material.dart';

class OrderModel {
  String id;
  String name;
  String number;
  String location;

  OrderModel(
      {
        required this.id,
        required this.name,
        required this.number,
        required this.location,});

  @override
  String toString() {
    return 'FoodDetail(title: $name, location: $location, number: $number, id: $id';
  }

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    id: json["id"] as String? ?? "",
    name: json['title'] as String? ?? "",
    location: json['location'] as String? ?? "",
    number: json["number"] as String? ?? "",
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'number': number,
    'location': location,
  };

  OrderModel copyWith({
    String? id,
    String? name,
    String? number,
    String? location,
  }) {
    return OrderModel(
      id: id ?? this.id,
      name: name ?? this.name,
      number: number ?? this.number,
      location: location ?? this.location,
    );
  }
}

class Attribute {
  final Icon icon;
  final String title;

  Attribute({required this.icon, required this.title});
}
