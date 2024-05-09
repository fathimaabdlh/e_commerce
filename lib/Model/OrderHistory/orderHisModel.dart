
class OrderHistory {
  List<Order>? order;

  OrderHistory({this.order});

  factory OrderHistory.fromJson(Map<String, dynamic> json) => OrderHistory(
        order: (json['order'] as List<dynamic>?)
            ?.map((e) => Order.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'order': order?.map((e) => e.toJson()).toList(),
      };
}

class Item {
  Product? product;
  int? quantity;
  String? size;
  String? id;

  Item({this.product, this.quantity, this.size, this.id});

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        product: json['product'] == null
            ? null
            : Product.fromJson(json['product'] as Map<String, dynamic>),
        quantity: json['quantity'] as int?,
        size: json['size'] as String?,
        id: json['_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'product': product?.toJson(),
        'quantity': quantity,
        'size': size,
        '_id': id,
      };
}

class Order {
  String? id;
  String? orderId;
  DateTime? orderdate;
  String? email;
  String? name;
  String? address;
  String? city;
  String? state;
  String? pincode;
  String? phoneno;
  List<Item>? items;
  int? total;
  int? totalamount;
  String? status;
  String? paymentId;
  int? v;

  Order({
    this.id,
    this.orderId,
    this.orderdate,
    this.email,
    this.name,
    this.address,
    this.city,
    this.state,
    this.pincode,
    this.phoneno,
    this.items,
    this.total,
    this.totalamount,
    this.status,
    this.paymentId,
    this.v,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json['_id'] as String?,
        orderId: json['orderID'] as String?,
        orderdate: json['orderdate'] == null
            ? null
            : DateTime.parse(json['orderdate'] as String),
        email: json['email'] as String?,
        name: json['name'] as String?,
        address: json['address'] as String?,
        city: json['city'] as String?,
        state: json['state'] as String?,
        pincode: json['pincode'] as String?,
        phoneno: json['phoneno'] as String?,
        items: (json['items'] as List<dynamic>?)
            ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
            .toList(),
        total: json['total'] as int?,
        totalamount: json['totalamount'] as int?,
        status: json['status'] as String?,
        paymentId: json['paymentID'] as String?,
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'orderID': orderId,
        'orderdate': orderdate?.toIso8601String(),
        'email': email,
        'name': name,
        'address': address,
        'city': city,
        'state': state,
        'pincode': pincode,
        'phoneno': phoneno,
        'items': items?.map((e) => e.toJson()).toList(),
        'total': total,
        'totalamount': totalamount,
        'status': status,
        'paymentID': paymentId,
        '__v': v,
      };
}
class Product {
  String? id;
  String? name;
  String? image;
  String? description;
  int? price;
  int? qty;
  String? category;
  int? v;

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
        id: json['_id'] as String?,
        name: json['name'] as String?,
        image: json['image'] as String?,
        description: json['description'] as String?,
        price: json['price'] as int?,
        qty: json['qty'] as int?,
        category: json['category'] as String?,
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'image': image,
        'description': description,
        'price': price,
        'qty': qty,
        'category': category,
        '__v': v,
      };
}