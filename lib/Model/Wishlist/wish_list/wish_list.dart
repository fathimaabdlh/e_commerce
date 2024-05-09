import 'wishlist.dart';

class WishList {
  List<Wishlist>? wishlist;

  WishList({this.wishlist});

  factory WishList.fromJson(Map<String, dynamic> json) => WishList(
        wishlist: (json['wishlist'] as List<dynamic>?)
            ?.map((e) => Wishlist.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        if (wishlist != null)
          'wishlist': wishlist?.map((e) => e.toJson()).toList(),
      };
}
