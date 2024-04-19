import 'verification.dart';

class Data {
  Verification? verification;
  String? id;
  String? role;
  String? name;
  String? email;
  num? phoneno;
  String? password;
  bool? isverified;
  DateTime? dateCreated;
  num? v;

  Data({
    this.verification,
    this.id,
    this.role,
    this.name,
    this.email,
    this.phoneno,
    this.password,
    this.isverified,
    this.dateCreated,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        verification: json['verification'] == null
            ? null
            : Verification.fromJson(
                Map<String, dynamic>.from(json['verification'])),
        id: json['_id']?.toString(),
        role: json['role']?.toString(),
        name: json['name']?.toString(),
        email: json['email']?.toString(),
        phoneno: num.tryParse(json['phoneno'].toString()),
        password: json['password']?.toString(),
        isverified: json['isverified']?.toString().contains("true"),
        dateCreated: json['dateCreated'] == null
            ? null
            : DateTime.tryParse(json['dateCreated'].toString()),
        v: num.tryParse(json['__v'].toString()),
      );

  Map<String, dynamic> toJson() => {
        if (verification != null) 'verification': verification?.toJson(),
        if (id != null) '_id': id,
        if (role != null) 'role': role,
        if (name != null) 'name': name,
        if (email != null) 'email': email,
        if (phoneno != null) 'phoneno': phoneno,
        if (password != null) 'password': password,
        if (isverified != null) 'isverified': isverified,
        if (dateCreated != null) 'dateCreated': dateCreated?.toIso8601String(),
        if (v != null) '__v': v,
      };
}
