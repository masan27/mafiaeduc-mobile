import 'package:mafiaeducation/models/grade_model.dart';
import 'package:mafiaeducation/models/learning_method_model.dart';
import 'package:mafiaeducation/models/subject_model.dart';

class LearningClass {
  final int? id;
  final String? title;
  final int? gradeId;
  final int? subjectId;
  final int? learningMethodId;
  final String? description;
  final String? additionalInfo;
  final int? price;
  final String? status;
  final LearningMethod? learningMethod;
  final Grade? grade;
  final Subject? subject;

  LearningClass({
    this.id,
    this.title,
    this.gradeId,
    this.subjectId,
    this.learningMethodId,
    this.description,
    this.additionalInfo,
    this.price,
    this.status,
    this.learningMethod,
    this.grade,
    this.subject,
  });

  factory LearningClass.fromJson(Map<String, dynamic> json) {
    return LearningClass(
      id: json['id'].runtimeType == String ? int.parse(json['id']) : json['id'],
      title: json['title'],
      gradeId: json['grade_id'].runtimeType == String ? int.parse(json['grade_id']) : json['grade_id'],
      subjectId: json['subject_id'].runtimeType == String ? int.parse(json['subject_id']) : json['subject_id'],
      learningMethodId: json['learning_method_id'].runtimeType == String ? int.parse(json['learning_method_id']) : json['learning_method_id'],
      description: json['description'],
      additionalInfo: json['additional_info'],
      price: json['price'].runtimeType == String ? int.parse(json['price']) : json['price'],
      status: json['status'],
      learningMethod: json['learning_method'] != null
          ? LearningMethod.fromJson(json['learning_method'])
          : null,
      grade: json['grade'] != null ? Grade.fromJson(json['grade']) : null,
      subject:
          json['subject'] != null ? Subject.fromJson(json['subject']) : null,
    );
  }

  Map<String, dynamic> toCheckout(LearningClass json) {
    return {
      'id': json.id,
      'title': json.title,
      'price': json.price,
      'status': json.status,
      'learningMethod': json.learningMethod?.name,
      'grade': json.grade?.name,
      'subject': json.subject?.name,
    };
  }
}
