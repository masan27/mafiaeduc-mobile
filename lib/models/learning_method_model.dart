class LearningMethod {
  final int? id;
  final String? name;
  final String? description;

  LearningMethod({
    this.id,
    this.name,
    this.description,
  });

  factory LearningMethod.fromJson(Map<String, dynamic> json) {
    return LearningMethod(
      id: json['id'].runtimeType == String ? int.parse(json['id']) : json['id'],
      name: json['name'],
      description: json['description'],
    );
  }
}