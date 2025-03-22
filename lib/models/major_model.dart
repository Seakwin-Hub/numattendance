class MajorModel {
  String? facultyName;
  String? majorId;
  String? majorName;

  MajorModel({this.facultyName, this.majorId, this.majorName});

  MajorModel.fromJson(Map<String, dynamic> json) {
    facultyName = json['faculty'];
    majorId = json['major_id'];
    majorName = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['faculty'] = facultyName;
    data['major_id'] = majorId;
    data['name'] = majorName;

    return data;
  }
}
