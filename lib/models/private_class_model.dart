import 'package:mafiaeducation/models/grade_model.dart';
import 'package:mafiaeducation/models/learning_method_model.dart';
import 'package:mafiaeducation/models/mentor_model.dart';
import 'package:mafiaeducation/models/subject_model.dart';

class PrivateClass {
  int? id;
  int? mentorId;
  int? subjectId;
  int? learningMethodId;
  int? gradeId;
  String? description;
  String? address;
  int? price;
  int? totalSlot;
  String? status;
  String? createdAt;
  String? updatedAt;
  LearningMethod? learningMethod;
  Grade? grade;
  Subject? subject;
  Mentor? mentor;

  PrivateClass({
    this.id,
    this.mentorId,
    this.subjectId,
    this.learningMethodId,
    this.gradeId,
    this.description,
    this.address,
    this.price,
    this.totalSlot,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.learningMethod,
    this.grade,
    this.subject,
    this.mentor,
  });

  factory PrivateClass.fromJson(Map<String, dynamic> json) {
    return PrivateClass(
      id: json['id'].runtimeType == String ? int.parse(json['id']) : json['id'],
      mentorId: json['mentor_id'].runtimeType == String ? int.parse(json['mentor_id']) : json['mentor_id'],
      subjectId: json['subjectId'].runtimeType == String ? int.parse(json['subjectId']) : json['subjectId'],
      learningMethodId: json['learning_method_id'].runtimeType == String ? int.parse(json['learning_method_id']) : json['learning_method_id'],
      gradeId: json['grade_id'].runtimeType == String ? int.parse(json['grade_id']) : json['grade_id'],
      description: json['description'],
      address: json['address'],
      price: json['price'].runtimeType == String ? int.parse(json['price']) : json['price'],
      totalSlot: json['total_slot'].runtimeType == String ? int.parse(json['total_slot']) : json['total_slot'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      learningMethod: json['learning_method'] != null
          ? LearningMethod.fromJson(json['learning_method'])
          : null,
      grade: json['grade'] != null ? Grade.fromJson(json['grade']) : null,
      subject: json['subject'] != null ? Subject.fromJson(json['subject']) : null,
      mentor: json['mentor'] != null ? Mentor.fromJson(json['mentor']) : null,
    );
  }

  Map<String, dynamic> toCheckout(PrivateClass json) {
    return {
      'id': json.id,
      'title': "Private ${json.mentor?.fullName}",
      'price': json.price,
      'status': json.status,
      'learningMethod': json.learningMethod?.name,
      'grade': json.grade?.name,
      'subject': json.subject?.name,
    };
  }
}