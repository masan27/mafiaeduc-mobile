import 'package:mafiaeducation/models/grade_model.dart';

class LearningMaterial {
  final int? id;
  final String? title;
  final String? coverImage;
  final int? adminId;
  final int? gradeId;
  final String? price;
  final String? description;
  final int? totalPages;
  final String? benefits;
  final String? previewFile;
  final String? sourceFile;
  final String? status;
  final String? createdAt;
  final String? updatedAt;
  final String? author;
  final Grade? grade;

  LearningMaterial({
    this.id,
    this.title,
    this.coverImage,
    this.adminId,
    this.gradeId,
    this.price,
    this.description,
    this.totalPages,
    this.benefits,
    this.previewFile,
    this.sourceFile,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.author,
    this.grade,
  });

  factory LearningMaterial.fromJson(Map<String, dynamic> json) {
    return LearningMaterial(
      id: json['id'].runtimeType == String ? int.parse(json['id']) : json['id'],
      title: json['title'],
      coverImage: json['cover_image'],
      adminId: json['admin_id'].runtimeType == String ? int.parse(json['admin_id']) : json['admin_id'],
      gradeId: json['grade_id'].runtimeType == String ? int.parse(json['grade_id']) : json['grade_id'],
      price: json['price'],
      description: json['description'],
      totalPages: json['total_page'].runtimeType == String ? int.parse(json['total_page']) : json['total_page'],
      benefits: json['benefits'],
      previewFile: json['preview_file'],
      sourceFile: json['source_file'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      author: json['author'],
      grade: json['grade'] != null ? Grade.fromJson(json['grade']) : null,
    );
  }

  Map<String, dynamic> toCheckout(LearningMaterial json) {
    return {
      'id': json.id,
      'title': json.title,
      'price': json.price,
      'status': json.status,
      'learningMethod': null,
      'grade': json.grade?.name,
      'subject': null,      
    };
  }
}
