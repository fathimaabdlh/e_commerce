// import 'order.dart';

// class OrderModel {
//   String? success;
//   String? hai;
//   Order? order;

//   OrderModel({this.success, this.hai, this.order});

//   factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
//         success: json['success']?.toString(),
//         hai: json['hai']?.toString(),
//         order: json['order'] == null
//             ? null
//             : Order.fromJson(Map<String, dynamic>.from(json['order'])),
//       );

//   Map<String, dynamic> toJson() => {
//         if (success != null) 'success': success,
//         if (hai != null) 'hai': hai,
//         if (order != null) 'order': order?.toJson(),
//       };
// }
