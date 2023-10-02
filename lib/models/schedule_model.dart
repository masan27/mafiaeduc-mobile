import 'package:mafiaeducation/models/grade_model.dart';
import 'package:mafiaeducation/models/learning_class_model.dart';
import 'package:mafiaeducation/models/learning_method_model.dart';
import 'package:mafiaeducation/models/mentor_model.dart';
import 'package:mafiaeducation/models/private_class_model.dart';
import 'package:mafiaeducation/models/subject_model.dart';

class Schedule {
  final int? id;
  final int? learningMethodId;
  final int? privateClassesId;
  final int? groupClassesId;
  final int? mentorId;
  final int? gradeId;
  final int? subjectId;
  final String? meetingLink;
  final String? meetingPlatform;
  final String? address;
  final String? date;
  final String? time;
  final String? isDone;
  final String? createdAt;
  final String? updatedAt;
  final Mentor? mentor;
  final Grade? grade;
  final Subject? subject;
  final LearningMethod? learningMethod;
  final PrivateClass? privateClass;
  final LearningClass? groupClass;

  Schedule({
    this.id,
    this.learningMethodId,
    this.privateClassesId,
    this.groupClassesId,
    this.mentorId,
    this.gradeId,
    this.subjectId,
    this.meetingLink,
    this.meetingPlatform,
    this.address,
    this.date,
    this.time,
    this.isDone,
    this.createdAt,
    this.updatedAt,
    this.mentor,
    this.grade,
    this.subject,
    this.learningMethod,
    this.privateClass,
    this.groupClass,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      id: json['id'],
      learningMethodId: json['learning_method_id'].runtimeType == String ? int.parse(json['learning_method_id']) : json['learning_method_id'],
      privateClassesId: json['private_classes_id'].runtimeType == String ? int.parse(json['private_classes_id']) : json['private_classes_id'],
      groupClassesId: json['group_classes_id'].runtimeType == String ? int.parse(json['group_classes_id']) : json['group_classes_id'],
      mentorId: json['mentor_id'].runtimeType == String ? int.parse(json['mentor_id']) : json['mentor_id'],
      gradeId: json['grade_id'].runtimeType == String ? int.parse(json['grade_id']) : json['grade_id'],
      subjectId: json['subject_id'].runtimeType == String ? int.parse(json['subject_id']) : json['subject_id'],
      meetingLink: json['meeting_link'],
      meetingPlatform: json['meeting_platform'],
      address: json['address'],
      date: json['date'],
      time: json['time'],
      isDone: json['is_done'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      mentor: json['mentor'] != null ? Mentor.fromJson(json['mentor']) : null,
      grade: json['grade'] != null ? Grade.fromJson(json['grade']) : null,
      subject:
          json['subject'] != null ? Subject.fromJson(json['subject']) : null,
      learningMethod: json['learning_method'] != null
          ? LearningMethod.fromJson(json['learning_method'])
          : null,
      privateClass: json['private_class'] != null
          ? PrivateClass.fromJson(json['private_class'])
          : null,
      groupClass: json['group_class'] != null
          ? LearningClass.fromJson(json['group_class'])
          : null,
    );
  }
}
