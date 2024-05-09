import 'item.dart';

class Cart {
  String? id;
  String? user;
  List<Item>? items;
  num? totalPrice;
  dynamic coupencode;
  dynamic discount;
  dynamic discountprice;
  num? v;

  Cart({
    this.id,
    this.user,
    this.items,
    this.totalPrice,
    this.coupencode,
    this.discount,
    this.discountprice,
    this.v,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json['_id']?.toString(),
        user: json['user']?.toString(),
        items: (json['items'] as List<dynamic>?)
            ?.map((e) => Item.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
        totalPrice: num.tryParse(json['totalPrice'].toString()),
        coupencode: json['coupencode'],
        discount: json['discount'],
        discountprice: json['discountprice'],
        v: num.tryParse(json['__v'].toString()),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) '_id': id,
        if (user != null) 'user': user,
        if (items != null) 'items': items?.map((e) => e.toJson()).toList(),
        if (totalPrice != null) 'totalPrice': totalPrice,
        if (coupencode != null) 'coupencode': coupencode,
        if (discount != null) 'discount': discount,
        if (discountprice != null) 'discountprice': discountprice,
        if (v != null) '__v': v,
      };
}
