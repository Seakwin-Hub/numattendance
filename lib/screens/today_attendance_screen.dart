import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numattendance/widgets/color_extension.dart';
import 'package:numattendance/widgets/custom_app_bar.dart';
import 'package:numattendance/widgets/header_widget.dart';
import 'package:numattendance/utils/styles.dart';
import 'package:numattendance/utils/dimensions.dart';
import 'package:numattendance/utils/images.dart';
import 'package:numattendance/widgets/detail_attendance_widget.dart';
import 'package:numattendance/models/user_model.dart';

class TodayAttendanceScreen extends StatelessWidget {
  const TodayAttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel userModel = UserModel(
      username: "phan sophannet",
      majorId: "Robotic Engineering",
      admissionClass: "21 E",
      generation: "29/54",
    );
    return Scaffold(
      backgroundColor: TColor.bg,
      appBar: CustomAppBar(
        title: "previous attendence".toUpperCase(),
        isArrowIcon: true,
        context: context,
        isLogoAppBar: true,
        onPressed: () => Get.back(),
      ),
      body: Column(
        children: [
          HeaderWidget(
            profileImage: Images.phannet,
            color: TColor.primaryColor,
            userInfo:
                "\nMajor ${userModel.majorId}\nClass ${userModel.admissionClass} | Gen ${userModel.generation}",
            username: userModel.username,
            radius: Dimensions.paddingSizeLarge * 2,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  DetailAttendanceWidget(
                    studentName: "",
                    backgroundColor: TColor.primaryColor,
                    subject: "Mathematics",
                    isTodayScreen: true,
                    showSubject: false,
                    showBtn: false,
                  ),
                  Container(
                    margin: EdgeInsets.all(Dimensions.paddingSizeDefault),
                    padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: TColor.primaryColor,
                      borderRadius:
                          BorderRadius.circular(Dimensions.radiusLarge),
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          Images.attendStatus,
                          width: Get.width * 0.2,
                          color: Colors.white,
                        ),
                        Text(
                          "attendance status".toUpperCase(),
                          style: robotoBold.copyWith(
                            color: Colors.white,
                            fontSize: Dimensions.fontSizeExtraLarge(context),
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.paddingSizeDefault,
                        ),
                        Container(
                          padding: EdgeInsets.all(28),
                          decoration: BoxDecoration(
                              color: TColor.presentColor,
                              borderRadius: BorderRadius.circular(24)),
                          child: Column(
                            children: [
                              Text(
                                "Present".toUpperCase(),
                                style: robotoBold.copyWith(
                                  color: Colors.white,
                                  fontSize:
                                      Dimensions.fontSizeExtraLarge(context) +
                                          10,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(24),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Text(
                                  "P",
                                  style: robotoBold.copyWith(
                                    color: TColor.presentColor,
                                    fontSize:
                                        Dimensions.fontSizeExtraLarge(context) *
                                            2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.paddingSizeDefault,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              padding: EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: TColor.lateColore,
                              ),
                              child: Text(
                                "P",
                                style: robotoBold.copyWith(
                                  color: Colors.white,
                                  fontSize:
                                      Dimensions.fontSizeExtraLarge(context),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: TColor.absentColor,
                              ),
                              child: Text(
                                "A",
                                style: robotoBold.copyWith(
                                  color: Colors.white,
                                  fontSize:
                                      Dimensions.fontSizeExtraLarge(context),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: TColor.presentColor,
                              ),
                              child: Text(
                                "L",
                                style: robotoBold.copyWith(
                                  color: Colors.white,
                                  fontSize:
                                      Dimensions.fontSizeExtraLarge(context),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Present",
                              style: robotoBold.copyWith(
                                color: TColor.lateColore,
                                fontSize: Dimensions.fontSizeDefault(context),
                              ),
                            ),
                            Text(
                              "Absent",
                              style: robotoBold.copyWith(
                                color: TColor.absentColor,
                                fontSize: Dimensions.fontSizeDefault(context),
                              ),
                            ),
                            Text(
                              "Late",
                              style: robotoBold.copyWith(
                                color: TColor.presentColor,
                                fontSize: Dimensions.fontSizeDefault(context),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Dimensions.paddingSizeDefault,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
