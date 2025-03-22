import 'package:get/get.dart';
import 'package:numattendance/screens/attendenc_detail_screen.dart';
import 'package:numattendance/screens/attendence_prev_screen.dart';
import 'package:numattendance/screens/student_attendance.dart';
import 'package:numattendance/screens/teacher_attendance_screen.dart';
import 'package:numattendance/screens/today_attendance_screen.dart';
import 'package:numattendance/screens/login_screen.dart';
import 'package:numattendance/screens/register_screen.dart';
import 'package:numattendance/screens/door_screen.dart';
import 'package:numattendance/screens/notification_screen.dart';
import 'package:numattendance/screens/parent_screen.dart';
import 'package:numattendance/screens/profile_screen.dart';
import 'package:numattendance/screens/home_screen.dart';

class RouterHelper {
  //Route
  static const String initial = '/';
  static const String studentAttend = '/student-attend';
  static const String studentRegister = '/register';
  static const String login = '/login';
  static const String profile = '/profile';
  static const String notification = '/notification';
  static const String homeScreen = '/homepage';
  static const String doorScreen = '/door';
  static const String attendPrevScreen = "/attendprev";
  static const String teacherAttendance = "/t-attend";
  static const String teacherAttendanceDetail = "/t-attend-detail";
  static const String todayAttendanceScreen = '/today-attend';
  static const String parentHomeScreen = "/parent";
  static const String test = "/test";

  //Rout Call
  static String getInitialRoute() => initial;
  static String getStudentAttendanceRoute(String cardId) =>
      '$studentAttend?data=$cardId';
  static String getStudentRegisterRoute() => studentRegister;
  static String getLoginRoute() => login;
  static String getProfileRoute() => profile;
  static String getHomeScreen(String role) => '$homeScreen?role=$role';
  static String getNotificationScreen() => notification;
  static String getDoorScreen() => doorScreen;
  static String getAttendPrevScreen() => attendPrevScreen;
  static String getTAttendanceScreen() => teacherAttendance;
  static String getTAttendanceDetailScreen() => teacherAttendanceDetail;
  static String getTodayAttendanceScreen() => todayAttendanceScreen;
  static String getParentScreen() => parentHomeScreen;
  static String getTestRoute() => test;

  //List of Navigate Router

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => LoginScreen()),
    GetPage(name: studentRegister, page: () => StudentRegister()),
    GetPage(name: profile, page: () => StudentProfileScreen()),
    GetPage(name: notification, page: () => NotificationScreen()),
    GetPage(name: doorScreen, page: () => DoorScreen()),
    GetPage(name: attendPrevScreen, page: () => AttendencePrevScreen()),
    GetPage(name: teacherAttendance, page: () => TeacherAttendanceScreen()),
    GetPage(name: teacherAttendanceDetail, page: () => AttendencDetailScreen()),
    GetPage(name: todayAttendanceScreen, page: () => TodayAttendanceScreen()),
    GetPage(name: parentHomeScreen, page: () => ParentScreen()),
    GetPage(
        name: homeScreen,
        page: () {
          final role = Get.parameters['role'];
          return HomeScreen(role: role);
        }),
    GetPage(
        name: studentAttend,
        page: () {
          final cardId = Get.parameters['data'];
          return StudentAttendance(attendanceModel: cardId);
        }),
  ];
}
