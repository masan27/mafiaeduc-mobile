class Subject {
  final int? id;
  final String? name;
  final String? description;
  final int? status;

  Subject({
    this.id,
    this.name,
    this.description,
    this.status,
  });

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      id: json['id'].runtimeType == String ? int.parse(json['id']) : json['id'],
      name: json['name'],
      description: json['description'],
      status: json['status'].runtimeType == String ? int.parse(json['status']) : json['status'],
    );
  }
}