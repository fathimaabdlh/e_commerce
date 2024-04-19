import 'electronic.dart';
import 'fancy.dart';
import 'fasion.dart';
import 'jwellery.dart';

class CategorizedProducts {
  List<Fasion>? fasion;
  List<Electronic>? electronics;
  List<Jwellery>? jwellery;
  List<Fancy>? fancy;

  CategorizedProducts({
    this.fasion,
    this.electronics,
    this.jwellery,
    this.fancy,
  });

  factory CategorizedProducts.fromJson(Map<String, dynamic> json) {
    return CategorizedProducts(
      fasion: (json['fasion'] as List<dynamic>?)
          ?.map((e) => Fasion.fromJson(Map<String, dynamic>.from(e)))
          .toList(),
      electronics: (json['electronics'] as List<dynamic>?)
          ?.map((e) => Electronic.fromJson(Map<String, dynamic>.from(e)))
          .toList(),
      jwellery: (json['jwellery'] as List<dynamic>?)
          ?.map((e) => Jwellery.fromJson(Map<String, dynamic>.from(e)))
          .toList(),
      fancy: (json['fancy'] as List<dynamic>?)
          ?.map((e) => Fancy.fromJson(Map<String, dynamic>.from(e)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        if (fasion != null) 'fasion': fasion?.map((e) => e.toJson()).toList(),
        if (electronics != null)
          'electronics': electronics?.map((e) => e.toJson()).toList(),
        if (jwellery != null)
          'jwellery': jwellery?.map((e) => e.toJson()).toList(),
        if (fancy != null) 'fancy': fancy?.map((e) => e.toJson()).toList(),
      };
}
