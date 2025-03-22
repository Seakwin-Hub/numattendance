import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numattendance/widgets/color_extension.dart';
import 'package:numattendance/widgets/custom_app_bar.dart';
import 'package:numattendance/widgets/custom_box.dart';
import 'package:numattendance/widgets/header_widget.dart';
import 'package:numattendance/utils/styles.dart';
import 'package:numattendance/utils/dimensions.dart';
import 'package:numattendance/utils/images.dart';
import 'package:numattendance/models/user_model.dart';
import 'package:table_calendar/table_calendar.dart';

class AttendencePrevScreen extends StatelessWidget {
  const AttendencePrevScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel userModel = UserModel(
      username: "phan sophannet",
      majorId: "Robotic Engineering",
      admissionClass: "21 E",
      generation: "29/54",
    );
    DateTime today = DateTime.now();
    return Scaffold(
      backgroundColor: TColor.primaryColor,
      appBar: CustomAppBar(
        title: "previous attendence".toUpperCase(),
        isArrowIcon: true,
        context: context,
        isLogoAppBar: true,
        onPressed: () => Get.back(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Rank",
                      style: robotoBold.copyWith(
                        color: Colors.white,
                        fontSize: Dimensions.paddingSizeLarge,
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.paddingSizeSmall,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomBox(
                            imageColor: Colors.black,
                            title: "In Class",
                            value: "3",
                            color: TColor.bg,
                            radius: Dimensions.paddingSizeLarge,
                            paddingHorizontal: 0,
                            paddingVertical: Dimensions.paddingSizeDefault,
                            styleText: robotoRegular.copyWith(
                              color: Colors.black,
                              fontSize: Dimensions.fontSizeDefault(context),
                            ),
                            styleValue: robotoMedium.copyWith(
                              color: Colors.black,
                              fontSize:
                                  Dimensions.fontSizeExtraLarge(context) + 3,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Dimensions.paddingSizeDefault,
                        ),
                        Expanded(
                          child: CustomBox(
                            imageColor: Colors.black,
                            title: "In Generation",
                            value: "29",
                            color: TColor.bg,
                            radius: Dimensions.paddingSizeLarge,
                            paddingHorizontal: 0,
                            paddingVertical: Dimensions.paddingSizeDefault,
                            styleText: robotoRegular.copyWith(
                              color: Colors.black,
                              fontSize: Dimensions.fontSizeDefault(context),
                            ),
                            styleValue: robotoMedium.copyWith(
                              color: Colors.black,
                              fontSize:
                                  Dimensions.fontSizeExtraLarge(context) + 3,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.paddingSizeSmall,
                    ),
                    Text(
                      "Attendance in one month".toUpperCase(),
                      style: robotoBold.copyWith(
                        color: Colors.white,
                        fontSize: Dimensions.paddingSizeLarge,
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.paddingSizeSmall,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomBox(
                            imageColor: Colors.black,
                            title: "Attendance",
                            value: "3",
                            color: TColor.bg,
                            radius: Dimensions.paddingSizeLarge,
                            paddingHorizontal: 0,
                            paddingVertical: Dimensions.paddingSizeDefault,
                            styleText: robotoRegular.copyWith(
                              color: Colors.black,
                              fontSize: Dimensions.fontSizeDefault(context),
                            ),
                            styleValue: robotoMedium.copyWith(
                              color: Colors.black,
                              fontSize:
                                  Dimensions.fontSizeExtraLarge(context) + 3,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Dimensions.paddingSizeDefault,
                        ),
                        Expanded(
                          child: CustomBox(
                            imageColor: Colors.black,
                            title: "Skip Class",
                            value: "3",
                            color: Colors.red,
                            radius: Dimensions.paddingSizeLarge,
                            paddingHorizontal: 0,
                            paddingVertical: Dimensions.paddingSizeDefault,
                            styleText: robotoRegular.copyWith(
                              color: Colors.black,
                              fontSize: Dimensions.fontSizeDefault(context),
                            ),
                            styleValue: robotoMedium.copyWith(
                              color: Colors.black,
                              fontSize:
                                  Dimensions.fontSizeExtraLarge(context) + 3,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.paddingSizeExtraLarge,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TableCalendar(
                          locale: "en_US",
                          rowHeight: 43,
                          headerStyle: HeaderStyle(
                            formatButtonVisible: false,
                            titleCentered: true,
                          ),
                          focusedDay: today,
                          firstDay: DateTime.utc(2000, 01, 01),
                          lastDay: DateTime.utc(2030, 01, 01)),
                    ),
                    SizedBox(
                      height: Dimensions.paddingSizeExtraLarge,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
