import 'package:flutter/material.dart';

// if we mark a thing as final it is expected to get that when it is created
class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool
      isFavorite; // not marked as final because it is tracked by the user (immutable)

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false,
  });
}
