class SalesStatus {
  final int id;
  final String name;
  final String description;

  SalesStatus({
    required this.id,
    required this.name,
    required this.description,
  });

  factory SalesStatus.fromJson(Map<String, dynamic> json) {
    return SalesStatus(
      id: json['id'].runtimeType == String ? int.parse(json['id']) : json['id'],
      name: json['name'],
      description: json['description'],
    );
  }
}