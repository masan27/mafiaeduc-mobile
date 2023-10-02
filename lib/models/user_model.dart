class User {
  int? id;
  String? email;
  int? role;
  String? fullName;
  String? phone;
  String? address;
  String? schoolOrigin;
  DateTime? birthDate;
  String? gender;
  DateTime? registeredAt;
  String? grade;

  User({
    this.id,
    this.email,
    this.role,
    this.fullName,
    this.phone,
    this.address,
    this.schoolOrigin,
    this.birthDate,
    this.gender,
    this.grade,
    this.registeredAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'].runtimeType == String ? int.parse(json['id']) : json['id'],
      email: json['email'],
      role: json['role'].runtimeType == String ? int.parse(json['role']) : json['role'],
      fullName: json['full_name'],
      phone: json['phone'],
      address: json['address'],
      schoolOrigin: json['school_origin'],
      birthDate: json['birth_date'] != null
          ? DateTime.parse(json['birth_date'])
          : null,
      gender: json['gender'],
      grade: json['grade'],
      registeredAt: json['registered_at'] != null
          ? DateTime.parse(json['registered_at'])
          : null,
    );
  }
}
