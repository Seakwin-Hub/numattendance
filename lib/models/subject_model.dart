class SubjectModel {
  String? name;
  String? majorId;
  String? subjectId;

  SubjectModel({
    this.majorId,
    this.name,
    this.subjectId,
  });

  SubjectModel.toJson(Map<String, dynamic> json) {
    name = json['name'];
    majorId = json['major_id'];
    subjectId = json['subject_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['major_id'] = majorId;
    data['subject_id'] = subjectId;

    return data;
  }
}
