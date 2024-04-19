import 'categorized_products.dart';

class ASdfgh {
  String? success;
  CategorizedProducts? categorizedProducts;
  String? username;
  num? count;
  String? wishlist;

  ASdfgh({
    this.success,
    this.categorizedProducts,
    this.username,
    this.count,
    this.wishlist,
  });

  factory ASdfgh.fromJson(Map<String, dynamic> json) => ASdfgh(
        success: json['success']?.toString(),
        categorizedProducts: json['categorizedProducts'] == null
            ? null
            : CategorizedProducts.fromJson(
                Map<String, dynamic>.from(json['categorizedProducts'])),
        username: json['username']?.toString(),
        count: num.tryParse(json['count'].toString()),
        wishlist: json['wishlist']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (success != null) 'success': success,
        if (categorizedProducts != null)
          'categorizedProducts': categorizedProducts?.toJson(),
        if (username != null) 'username': username,
        if (count != null) 'count': count,
        if (wishlist != null) 'wishlist': wishlist,
      };
}
