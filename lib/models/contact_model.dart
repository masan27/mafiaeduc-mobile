class Contact {
  int? id;
  String? name;
  String? phone;

  Contact({this.id, this.name, this.phone});

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
    );
  }
}
