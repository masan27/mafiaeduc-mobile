import 'package:mafiaeducation/utils/mixin.dart';

class Product {
  final int id;
  final String title;
  final int price;
  final String coverImage;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.coverImage,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'] ?? 'Kelas Private ${json['mentor']['full_name']}',
      price: json['price'].runtimeType == String
          ? int.parse(json['price'])
          : json['price'],
      coverImage: json['mentor'] != null
          ? json['mentor']['photo']
          : (json['cover_image'] ?? Mixin().coverImage),
    );
  }
}
