class UserModel {
  String? username;
  String? role;
  DateTime? dateOfBirth;
  String? password;
  String? academinYear;
  String? admissionClass;
  String? registrationNum;
  String? phoneNumber;
  String? motherName;
  String? fatherName;
  String? majorId;
  String? email;
  DateTime? dateOfAdmission;
  String? admissionNum;
  String? gender;
  String? generation;

  UserModel({
    this.role,
    this.username,
    this.generation,
    this.majorId,
    this.dateOfBirth,
    this.password,
    this.academinYear,
    this.admissionClass,
    this.gender,
    this.registrationNum,
    this.phoneNumber,
    this.motherName,
    this.fatherName,
    this.admissionNum,
    this.dateOfAdmission,
    this.email,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    role = json['role'];
    username = json['username'];
    generation = json['generation'];
    majorId = json['major_id'];
    dateOfBirth = json['date_of_birth'] != null
        ? DateTime.parse(json["date_of_birth"])
        : null;
    password = json['password'];
    academinYear = json['academic_year'];
    admissionClass = json['admission_class'];
    gender = json['gender'];
    registrationNum = json['registration_number'];
    phoneNumber = json['phone_number'];
    motherName = json['mother_name'];
    fatherName = json['father_name'];
    admissionNum = json['admission_num'];
    dateOfAdmission = json['date_of_admission'] != null
        ? DateTime.parse(json["date_of_admission"])
        : null;
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    return {
      'role': role,
      'username': username,
      'generation': generation,
      'major_id': majorId,
      'date_of_birth': dateOfBirth?.toIso8601String(),
      'password': password,
      'academic_year': academinYear,
      'admission_class': admissionClass,
      'gender': gender,
      'registration_number': registrationNum,
      'phone_number': phoneNumber,
      'mother_name': motherName,
      'father_name': fatherName,
      'admission_number': admissionNum,
      'date_of_admission': dateOfAdmission?.toIso8601String(),
      'email': email,
    };
  }
}
