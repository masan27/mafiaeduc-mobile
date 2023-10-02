import 'package:mafiaeducation/models/subject_model.dart';

class Mentor {
  int? id;
  String? fullName;
  String? photo;
  String? phone;
  String? address;
  String? rating;
  List<Subject>? subjects;

  Mentor(
      {this.id,
      this.fullName,
      this.photo,
      this.phone,
      this.address,
      this.rating,
      this.subjects});

  factory Mentor.fromJson(Map<String, dynamic> json) {
    return Mentor(
      id: json['id'].runtimeType == String ? int.parse(json['id']) : json['id'],
      fullName: json['full_name'],
      photo: json['photo'],
      phone: json['phone'],
      address: json['address'],
      rating: json['rating'],
      subjects: json['subjects'] != null
          ? (json['subjects'] as List<dynamic>)
              .map((subjectJson) => Subject.fromJson(subjectJson))
              .toList()
          : null,
    );
  }
}
