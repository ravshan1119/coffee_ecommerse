class ClientOrderModel {
  int? id;
  String productName;
  String count;
  String firebaseId;

  ClientOrderModel({
    this.id,
    required this.productName,
    required this.count,
    required this.firebaseId,
  });

  ClientOrderModel copyWith({
    String? productName,
    String? count,
    String? firebaseId,
    int? id,

  }) =>
      ClientOrderModel(
        id: id ?? this.id,
        productName: productName ?? this.productName,
        count: count ?? this.count,
        firebaseId: firebaseId ?? this.firebaseId,
      );

  factory ClientOrderModel.fromJson(Map<String, dynamic> json) => ClientOrderModel(
    productName: json[EventModelFields.productName] as String? ?? "",
    count: json[EventModelFields.count] as String? ?? "",
    firebaseId: json[EventModelFields.firebaseId] as String? ?? "",
    id: json[EventModelFields.id] as int? ?? 0,
  );

  Map<String, dynamic> toJson() => {
    EventModelFields.productName: productName,
    EventModelFields.count: count,
    EventModelFields.firebaseId: firebaseId,
    EventModelFields.id: id,
  };
}

class EventModelFields {
  static const String id = "id";
  static const String productName = "product_name";
  static const String count = "count";
  static const String barCode = "bar_code";
  static const String firebaseId = "firebase_id";

  static const String omborTable = "ombor";
}
