class Product {
  String? id;
  String? name;
  String? image;
  String? description;
  num? price;
  num? qty;
  String? category;
  num? v;

  Product({
    this.id,
    this.name,
    this.image,
    this.description,
    this.price,
    this.qty,
    this.category,
    this.v,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['_id']?.toString(),
        name: json['name']?.toString(),
        image: json['image']?.toString(),
        description: json['description']?.toString(),
        price: num.tryParse(json['price'].toString()),
        qty: num.tryParse(json['qty'].toString()),
        category: json['category']?.toString(),
        v: num.tryParse(json['__v'].toString()),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) '_id': id,
        if (name != null) 'name': name,
        if (image != null) 'image': image,
        if (description != null) 'description': description,
        if (price != null) 'price': price,
        if (qty != null) 'qty': qty,
        if (category != null) 'category': category,
        if (v != null) '__v': v,
      };
}
