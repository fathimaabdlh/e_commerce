class Order {
  String? id;
  String? entity;
  num? amount;
  num? amountPaid;
  num? amountDue;
  String? currency;
  String? receipt;
  dynamic offerId;
  String? status;
  num? attempts;
  List<dynamic>? notes;
  num? createdAt;

  Order({
    this.id,
    this.entity,
    this.amount,
    this.amountPaid,
    this.amountDue,
    this.currency,
    this.receipt,
    this.offerId,
    this.status,
    this.attempts,
    this.notes,
    this.createdAt,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json['id']?.toString(),
        entity: json['entity']?.toString(),
        amount: num.tryParse(json['amount'].toString()),
        amountPaid: num.tryParse(json['amount_paid'].toString()),
        amountDue: num.tryParse(json['amount_due'].toString()),
        currency: json['currency']?.toString(),
        receipt: json['receipt']?.toString(),
        offerId: json['offer_id'],
        status: json['status']?.toString(),
        attempts: num.tryParse(json['attempts'].toString()),
        notes: List<dynamic>.from(json['notes'] ?? []),
        createdAt: num.tryParse(json['created_at'].toString()),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (entity != null) 'entity': entity,
        if (amount != null) 'amount': amount,
        if (amountPaid != null) 'amount_paid': amountPaid,
        if (amountDue != null) 'amount_due': amountDue,
        if (currency != null) 'currency': currency,
        if (receipt != null) 'receipt': receipt,
        if (offerId != null) 'offer_id': offerId,
        if (status != null) 'status': status,
        if (attempts != null) 'attempts': attempts,
        if (notes != null) 'notes': notes,
        if (createdAt != null) 'created_at': createdAt,
      };
}
