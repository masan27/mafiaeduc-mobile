import 'package:mafiaeducation/models/payment_method_model.dart';
import 'package:mafiaeducation/models/product_model.dart';
import 'package:mafiaeducation/models/sales_status_model.dart';

class Sales {
  final String? id;
  final int? salesStatusId;
  final DateTime? salesDate;
  final DateTime? confirmDate;
  final DateTime? paymentDate;
  final int? totalPrice;
  final DateTime? expires;
  final String? statusInfo;
  final int? feedback;
  final Product? product;
  final SalesStatus? status;
  final PaymentMethod? paymentMethod;
  final String? typeProduct;

  Sales({
    this.id,
    this.salesStatusId,
    this.salesDate,
    this.confirmDate,
    this.paymentDate,
    this.totalPrice,
    this.expires,
    this.statusInfo,
    this.feedback,
    this.product,
    this.status,
    this.paymentMethod,
    this.typeProduct,
  });

  factory Sales.fromJson(Map<String, dynamic> json) {
    return Sales(
      id: json['id'],
      salesStatusId: json['sales_status_id'].runtimeType == String
          ? int.parse(json['sales_status_id'])
          : json['sales_status_id'],
      salesDate: json['sales_date'] != null
          ? DateTime.parse(json['sales_date'])
          : null,
      confirmDate: json['confirm_date'] != null
          ? DateTime.parse(json['confirm_date'])
          : null,
      paymentDate: json['payment_date'] != null
          ? DateTime.parse(json['payment_date'])
          : null,
      totalPrice: json['total_price'],
      expires: json['expires_in'] != null
          ? DateTime.parse(json['expires_in'])
          : null,
      statusInfo: json['status_info'],
      feedback: json['feedback'].runtimeType == String
          ? int.parse(json['feedback'])
          : json['feedback'],
      product: json['detail']['products'][0] != null
          ? Product.fromJson(json['detail']['products'][0])
          : null,
      status:
          json['status'] != null ? SalesStatus.fromJson(json['status']) : null,
      paymentMethod: json['payment_method'] != null
          ? PaymentMethod.fromJson(json['payment_method'])
          : null,
      typeProduct: json['detail']['type_product'],
    );
  }
}
