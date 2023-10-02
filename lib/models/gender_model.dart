class Gender {
  String? name;
  String? description;

  Gender({
    this.name,
    this.description,
  });

  factory Gender.fromJson(Map<String, dynamic> json) {
    return Gender(
      name: json['name'],
      description: json['description']
    );
  }
}
