class PaymentMethod {
  final int? id;
  final String? name;
  final String? description;
  final int? fee;
  final String? accountNumber;
  final String? type;
  final bool? status;

  PaymentMethod({
    this.id,
    this.name,
    this.description,
    this.fee,
    this.accountNumber,
    this.type,
    this.status,
  });

  factory PaymentMethod.fromJson(Map<String, dynamic> json) {
    return PaymentMethod(
      id: json['id'].runtimeType == String ? int.parse(json['id']) : json['id'],
      name: json['name'],
      description: json['description'],
      fee: json['fee'].runtimeType == String ? int.parse(json['fee']) : json['fee'],
      accountNumber: json['account_number'],
      type: json['type'],
      status: json['status'].runtimeType == String ? bool.fromEnvironment(json['status']) : json['status'],
    );
  }
}
