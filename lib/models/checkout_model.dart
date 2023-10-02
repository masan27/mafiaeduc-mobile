class Checkout {
  final int? id;
  final String? title;
  final int? price;
  final String? status;
  final String? learningMethod;
  final String? grade;
  final String? subject;

  Checkout({
    this.id,
    this.title,
    this.price,
    this.status,
    this.learningMethod,
    this.grade,
    this.subject,
  });

  factory Checkout.fromJson(Map<String, dynamic> json) {
    return Checkout(
      id: json['id'],
      title: json['title'],
      price: json['price'].runtimeType == String ? int.parse(json['price']) : json['price'],
      status: json['status'].runtimeType == String ? json['status'] : json['status'].toString(),
      learningMethod: json['learningMethod'],
      grade: json['grade'],
      subject: json['subject'],
    );
  }
}
