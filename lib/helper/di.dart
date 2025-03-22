import 'package:get/get.dart';
import 'package:numattendance/controllers/attendance_controller.dart';
import 'package:numattendance/controllers/auth_controller.dart';

void init() {
  /// Controller Register
  Get.lazyPut(() => AttendanceController());
  Get.lazyPut(() => AuthController());
}
