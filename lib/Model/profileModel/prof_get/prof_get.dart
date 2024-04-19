import 'data.dart';

class ProfGet {
  String? success;
  Data? data;

  ProfGet({this.success, this.data});

  factory ProfGet.fromJson(Map<String, dynamic> json) => ProfGet(
        success: json['success']?.toString(),
        data: json['data'] == null
            ? null
            : Data.fromJson(Map<String, dynamic>.from(json['data'])),
      );

  Map<String, dynamic> toJson() => {
        if (success != null) 'success': success,
        if (data != null) 'data': data?.toJson(),
      };
}
