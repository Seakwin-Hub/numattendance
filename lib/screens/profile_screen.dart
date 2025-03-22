import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numattendance/widgets/color_extension.dart';
import 'package:numattendance/helper/router_helper.dart';
import 'package:numattendance/widgets/custom_app_bar.dart';
import 'package:numattendance/widgets/custom_bottom.dart';
import 'package:numattendance/widgets/header_widget.dart';
import 'package:numattendance/utils/dimensions.dart';
import 'package:numattendance/utils/images.dart';
import 'package:numattendance/models/user_model.dart';
import 'package:numattendance/widgets/profile_info_widget.dart';

class StudentProfileScreen extends StatelessWidget {
  const StudentProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel userModel = UserModel(
      username: "phan sophannet",
      majorId: "Robotic Engineering",
      admissionClass: "21 E",
      generation: "29/54",
    );

    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        title: "My Profile",
        isAlertIcon: true,
        isArrowIcon: true,
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
            onTapImage: () => {},
          ),
          SizedBox(
            height: Dimensions.radiusExtraLarge * 1.5,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.paddingSizeDefault),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.paddingSizeDefault),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: ProfileInfoWidget(
                                    title: "Registration Number",
                                    value: "2024-ASDF-2025",
                                  ),
                                ),
                                SizedBox(
                                  width: Dimensions.paddingSizeExtraLarge,
                                ),
                                Expanded(
                                  child: ProfileInfoWidget(
                                    title: "Academic Year",
                                    value: "2024-2025",
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: ProfileInfoWidget(
                                    title: "Admission Class",
                                    value: "25-E",
                                  ),
                                ),
                                SizedBox(
                                  width: Dimensions.paddingSizeExtraLarge,
                                ),
                                Expanded(
                                  child: ProfileInfoWidget(
                                    title: "Admission Number",
                                    value: "NUM-000111",
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: ProfileInfoWidget(
                                    title: "Date of Admission",
                                    value: "01 Jan 2022",
                                  ),
                                ),
                                SizedBox(
                                  width: Dimensions.paddingSizeExtraLarge,
                                ),
                                Expanded(
                                  child: ProfileInfoWidget(
                                    title: "Date of Birth",
                                    value: "03 March 2006",
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.paddingSizeExtraLarge,
                      ),
                      ProfileInfoWidget(
                        title: "Email",
                        value: "phansophanith@num.edu.kh",
                      ),
                      ProfileInfoWidget(
                        title: "Father Name",
                        value: "Mann Sophan",
                      ),
                      ProfileInfoWidget(
                        title: "Mother Name",
                        value: "Ty Sreykim",
                      ),
                      ProfileInfoWidget(
                        title: "Phone Number",
                        value: "+855 11355263",
                      ),
                      CustomBottom(
                        buttonText: "Log Out",
                        onPressed: () => Get.offAllNamed(
                          RouterHelper.getLoginRoute(),
                        ),
                        width: Get.width,
                        margin: EdgeInsets.symmetric(
                            vertical: Dimensions.paddingSizeDefault),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
