import 'product.dart';

class Item {
  Product? product;
  num? quantity;
  String? size;
  String? id;

  Item({this.product, this.quantity, this.size, this.id});

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        product: json['product'] == null
            ? null
            : Product.fromJson(Map<String, dynamic>.from(json['product'])),
        quantity: num.tryParse(json['quantity'].toString()),
        size: json['size']?.toString(),
        id: json['_id']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (product != null) 'product': product?.toJson(),
        if (quantity != null) 'quantity': quantity,
        if (size != null) 'size': size,
        if (id != null) '_id': id,
      };
}
