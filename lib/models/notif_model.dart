import 'package:mafiaeducation/models/sales_model.dart';

class Notif {
  final int? id;
  final String? salesId;
  final String? title;
  final String? body;
  final String? type;
  final bool? isRead;
  final String? readAt;
  final DateTime? createdAt;
  final Sales? sales;

  Notif(
      {this.id,
      this.salesId,
      this.title,
      this.body,
      this.type,
      this.isRead,
      this.readAt,
      this.createdAt,
      this.sales});

  factory Notif.fromJson(Map<String, dynamic> json) {
    return Notif(
      id: json['id'].runtimeType == String ? int.parse(json['id']) : json['id'],
      salesId: json['sales_id'],      
      title: json['title'],
      body: json['body'],
      type: json['type'],
      isRead: json['is_read'],
      readAt: json['read_at'],
      createdAt: DateTime.parse(json['created_at']),
      sales: json['sales'] != null
          ? Sales.fromJson(json['sales'])
          : null,
    );
  }
}
