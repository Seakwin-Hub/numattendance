class AttendanceModel {
  String? cardId;
  String? checkInTime;
  String? date;
  String? idNumber;
  String? userName;

  AttendanceModel({
    this.cardId,
    this.checkInTime,
    this.date,
    this.idNumber,
    this.userName,
  });

  AttendanceModel.fromJson(Map<String, dynamic> json) {
    cardId = json['cardID'];
    checkInTime = json['checkInTime'];
    date = json['date'];
    idNumber = json['idNumber'];
    userName = json['userName'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cardID'] = cardId;
    data['checkInTime'] = checkInTime;
    data['date'] = date;
    data['idNumber'] = idNumber;
    data['userName'] = userName;
    return data;
  }
}
