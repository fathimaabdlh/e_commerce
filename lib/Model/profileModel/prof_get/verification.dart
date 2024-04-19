class Verification {
  String? code;
  DateTime? expiry;

  Verification({this.code, this.expiry});

  factory Verification.fromJson(Map<String, dynamic> json) => Verification(
        code: json['code']?.toString(),
        expiry: json['expiry'] == null
            ? null
            : DateTime.tryParse(json['expiry'].toString()),
      );

  Map<String, dynamic> toJson() => {
        if (code != null) 'code': code,
        if (expiry != null) 'expiry': expiry?.toIso8601String(),
      };
}
