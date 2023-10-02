class LearningType {
  int? id;
  String? name;

  LearningType({
    this.id,
    this.name,
  });

  factory LearningType.fromJson(Map<String, dynamic> json) {
    return LearningType(
      id: int.parse(json['id']),
      name: json['name']
    );
  }
}
