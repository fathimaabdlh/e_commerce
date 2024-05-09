import 'product.dart';

class Wishlist {
  Product? product;
  String? id;

  Wishlist({this.product, this.id});

  factory Wishlist.fromJson(Map<String, dynamic> json) => Wishlist(
        product: json['product'] == null
            ? null
            : Product.fromJson(Map<String, dynamic>.from(json['product'])),
        id: json['_id']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (product != null) 'product': product?.toJson(),
        if (id != null) '_id': id,
      };
}
