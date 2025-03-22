import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numattendance/widgets/color_extension.dart';
import 'package:numattendance/widgets/custom_app_bar.dart';
import 'package:numattendance/utils/dimensions.dart';
import 'package:numattendance/widgets/detail_attendance_widget.dart';

class StudentAttendance extends StatelessWidget {
  const StudentAttendance({super.key, this.attendanceModel});
  final String? attendanceModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.primaryColor,
      appBar: CustomAppBar(
        title: attendanceModel,
        isArrowIcon: true,
        context: context,
        isLogoAppBar: true,
        onPressed: () => Get.back(),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimensions.radiusExtraLarge),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              DetailAttendanceWidget(
                studentName: "",
                backgroundColor: Colors.white,
                subject: "Mathematics",
                buttonType: "today",
                textBtn: "today attendance",
              ),
              DetailAttendanceWidget(
                studentName: "",
                backgroundColor: Colors.white,
                subject: "Mathematics",
                textBtn: "previous attendance",
                buttonType: "previous",
              ),
              DetailAttendanceWidget(
                studentName: "",
                textBtn: "idontknow",
                backgroundColor: Colors.white,
                subject: "Mathematics",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
