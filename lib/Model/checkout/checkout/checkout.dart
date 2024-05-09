import 'cart.dart';

class Checkout {
  Cart? cart;
  num? totalamount;
  num? count;

  Checkout({this.cart, this.totalamount, this.count});

  factory Checkout.fromJson(Map<String, dynamic> json) => Checkout(
        cart: json['cart'] == null
            ? null
            : Cart.fromJson(Map<String, dynamic>.from(json['cart'])),
        totalamount: num.tryParse(json['totalamount'].toString()),
        count: num.tryParse(json['count'].toString()),
      );

  Map<String, dynamic> toJson() => {
        if (cart != null) 'cart': cart?.toJson(),
        if (totalamount != null) 'totalamount': totalamount,
        if (count != null) 'count': count,
      };
}
