import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numattendance/widgets/color_extension.dart';
import 'package:numattendance/helper/router_helper.dart';
import 'package:numattendance/widgets/custom_app_bar.dart';
import 'package:numattendance/widgets/header_widget.dart';
import 'package:numattendance/utils/styles.dart';
import 'package:numattendance/utils/dimensions.dart';
import 'package:numattendance/utils/images.dart';
import 'package:numattendance/widgets/class_widget_subject.dart';
import 'package:numattendance/models/user_model.dart';

class TeacherAttendanceScreen extends StatelessWidget {
  const TeacherAttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel userModel = UserModel(
      username: "phan sophannet",
      majorId: "Robotic Engineering",
      admissionClass: "21 E",
      generation: "29/54",
    );
    return Scaffold(
      backgroundColor: TColor.primaryColor,
      appBar: CustomAppBar(
        title: "Attenedance",
        context: context,
        isArrowIcon: true,
        onPressed: () => Get.back(),
        isLogoAppBar: true,
      ),
      body: Column(
        children: [
          HeaderWidget(
            profileImage: Images.tvichet,
            color: TColor.primaryColor,
            userInfo:
                "\nMajor ${userModel.majorId}\nClass ${userModel.admissionClass} | Gen ${userModel.generation}",
            username: userModel.username,
            radius: Dimensions.paddingSizeLarge * 2,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 15,
                  color: Color.fromARGB(255, 240, 239, 239),
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(35),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      "Classes".toUpperCase(),
                      style: robotoBold.copyWith(
                        color: Colors.black,
                        fontSize: Dimensions.paddingSizeLarge,
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.paddingSizeDefault,
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 240, 239, 239),
                        borderRadius: BorderRadius.circular(
                          Dimensions.radiusDefault,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Class",
                            style: robotoRegular.copyWith(
                              color: Colors.black,
                              fontSize: Dimensions.fontSizeDefault(context),
                            ),
                          ),
                          Center(
                            child: Text(
                              "4",
                              style: robotoBold.copyWith(
                                color: Colors.black,
                                fontSize:
                                    Dimensions.fontSizeExtraLarge(context) * 2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.paddingSizeDefault,
                    ),
                    Text(
                      "Subject".toUpperCase(),
                      style: robotoBold.copyWith(
                        color: Colors.black,
                        fontSize: Dimensions.paddingSizeLarge,
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.paddingSizeDefault,
                    ),
                    ClassSubjectWidget(
                      subjectDetail: () => Get.toNamed(
                          RouterHelper.getTAttendanceDetailScreen()),
                      majorAndGen: "IT 30/54",
                      subject: "Java Programming",
                      totalStudent: "10",
                      absentPerson: "15%",
                      latePerson: "10%",
                      sex: "",
                      studentId: "",
                      studentName: "",
                      absentStuList: "",
                      lateStuList: "",
                    ),
                    SizedBox(
                      height: Dimensions.paddingSizeDefault,
                    ),
                    ClassSubjectWidget(
                      subjectDetail: () => Get.toNamed(
                          RouterHelper.getTAttendanceDetailScreen()),
                      majorAndGen: "IT 30/54",
                      subject: "Java Programming",
                      totalStudent: "10",
                      absentPerson: "15%",
                      latePerson: "10%",
                      sex: "",
                      studentId: "",
                      studentName: "",
                      absentStuList: "",
                      lateStuList: "",
                    ),
                    SizedBox(
                      height: Dimensions.paddingSizeDefault,
                    ),
                    ClassSubjectWidget(
                      subjectDetail: () => {},
                      majorAndGen: "Previous Attendance",
                      subject: "Java Programming",
                      totalStudent: "10",
                      absentPerson: "15%",
                      latePerson: "10%",
                      sex: "",
                      studentId: "",
                      studentName: "",
                      absentStuList: "",
                      lateStuList: "",
                    ),
                    SizedBox(
                      height: Dimensions.paddingSizeDefault,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
