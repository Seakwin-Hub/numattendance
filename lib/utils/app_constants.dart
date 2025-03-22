import 'package:numattendance/utils/images.dart';
import 'package:numattendance/models/info_model.dart';

class AppConstants {
  static const String appName = "Num Attendance";
  static const double appVersion = 1.0;

  static const String fontFamily = "Roboto";

  //Student Detial Static
  static const String registrationNum = "2024-ASDF-2025";
  static const List<String> academinYear = [
    "2023-2024",
    "2024-2025",
    "2025-2026"
  ];
  static const List<String> major = [
    "Information Technology",
    "Management",
    "International Law"
  ];

  static const List<String> studentGender = [
    "Male",
    "Female",
  ];

  static List<InfoModel> infoModel = [
    InfoModel(title: "Attendance", value: "60:68%"),
    InfoModel(title: "Tuition Fee", value: "1200\$"),
    InfoModel(title: Images.graduate, value: "Academic"),
    InfoModel(title: Images.attend3, value: "Attendance"),
    InfoModel(title: Images.curriculum, value: "Study Schedule"),
    InfoModel(title: Images.doorManage, value: "Door Manage"),
    InfoModel(title: Images.assignment, value: "Assignment"),
    InfoModel(title: Images.classPower, value: "Class Power"),
  ];

  static const List<String> admissionClass = [
    "25-E",
    "13-E",
    "16-E",
    "20-E",
  ];
  static const List<String> academicHour = [
    "07:30-10:30",
    "14:00-17:00",
  ];
  static const String dateOfAdmission = "01-Jan-2022";
  static const String admissionNum = "NUM-000100";
  static const String emailAdded = "@num.edu.kh";
  static const String generation = "29/54";

  //Attendance Status
  static const String present = "present";
  static const String absent = "absent";
  static const String premission = "permission";
  static const String late = "late";
}
