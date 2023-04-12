import 'dart:convert';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  Product({
    required this.id,
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    required this.color,
    required this.inCart,
    required this.storeImage,
    required this.storeName,
    this.quantity = 1,
  });

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as num,
      image: map['image'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      price: map['price'] as num,
      color: map['color'] as List<dynamic>,
      inCart: map['inCart'] as bool,
      storeImage: map['storeImage'] as String,
      storeName: map['storeName'] as String,
      quantity: 1,
    );
  }
  final num id;
  final String image;
  final String name;
  final String description;
  final num price;
  final List<dynamic>? color;
  final bool inCart;
  final String storeImage;
  final String storeName;
  int quantity = 1;

  //takes all the properties(which need to change) and their corresponding values and returns new object with your desired properties.
  Product copyWith({
    num? id,
    String? image,
    String? name,
    String? description,
    num? price,
    List<dynamic>? color,
    bool? inCart,
    String? storeImage,
    String? storeName,
    int? quantity = 1,
  }) {
    return Product(
      id: id ?? this.id,
      image: image ?? this.image,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      color: color ?? this.color,
      inCart: inCart ?? this.inCart,
      storeImage: storeImage ?? this.storeImage,
      storeName: storeName ?? this.storeName,
      quantity: quantity ?? 1,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'image': image,
      'name': name,
      'description': description,
      'price': price,
      'color': color,
      'inCart': inCart,
      'storeImage': storeImage,
      'storeName': storeName,
      'quantity': quantity,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      //image,
      name,
      // description,
      // price,
      // color!,
      // inCart,
      // storeImage,
      // storeName,
      quantity
    ];
  }

  void increment() => quantity += 1;
  void decrement() => quantity -= 1;
}
