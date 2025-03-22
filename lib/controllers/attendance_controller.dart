import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:numattendance/models/attendance_model.dart';

class AttendanceController extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<AttendanceModel> _attendanceList = [];
  List<AttendanceModel> get attendanceList => _attendanceList;

  List<AttendanceModel> _attendanceIdList = [];
  List<AttendanceModel> get attendanceIdList => _attendanceIdList;

  void setIsloading() {
    _isLoading = !_isLoading;
    update();
  }

  Future<List<AttendanceModel>> getList({int? offset}) async {
    _isLoading = true;
    update();

    try {
      final attend = await FirebaseFirestore.instance
          .collection("Student_Attendances")
          .get();
      _attendanceList = attend.docs
          .map((element) => AttendanceModel.fromJson(element.data()))
          .toList();
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("Failure with error '${e.code}' : '${e.message}'");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    _isLoading = false;
    update();
    return _attendanceList;
  }

  Future<List<AttendanceModel>> getAttendanceId(String? id) async {
    _isLoading = true;
    update();
    try {
      final attend = await FirebaseFirestore.instance
          .collection("Student_Attendances")
          .where("cardID", isEqualTo: id) // Search by field name
          .get();

      _attendanceIdList = attend.docs
          .map((element) => AttendanceModel.fromJson(element.data()))
          .toList();
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("Failure with error '${e.code}' : '${e.message}'");
      }
    } catch (e) {
      throw Exception(e.toString());
    }

    _isLoading = true;
    update();
    return _attendanceIdList;
  }
}
