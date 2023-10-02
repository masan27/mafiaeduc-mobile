class Grade {
  int? id;
  String? name;
  String? description;

  Grade({
    this.id,
    this.name,
    this.description,
  });

  factory Grade.fromJson(Map<String, dynamic> json) {
    return Grade(
      id: json['id'].runtimeType == String ? int.parse(json['id']) : json['id'],
      name: json['name'],
      description: json['description'],
    );
  }
}